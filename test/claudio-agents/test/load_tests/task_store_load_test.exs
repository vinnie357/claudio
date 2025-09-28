defmodule TaskApp.TaskStoreLoadTest do
  use ExUnit.Case, async: false
  alias TaskApp.{TaskStore, Task, TestHelpers}

  @moduletag :load_test
  @moduletag timeout: 60_000

  describe "TaskStore under high load" do
    setup do
      # Use a single store for load testing to simulate real conditions
      {:ok, store_pid} = TaskStore.start_link(name: :load_test_store)
      
      on_exit(fn ->
        if Process.alive?(store_pid) do
          GenServer.stop(store_pid, :normal, 5000)
        end
      end)
      
      %{store_pid: store_pid}
    end

    @tag :load_test
    test "handles high concurrent task creation", %{store_pid: store_pid} do
      # Configuration
      concurrent_processes = 50
      tasks_per_process = 100
      total_expected_tasks = concurrent_processes * tasks_per_process

      IO.puts("\n🚀 Starting load test: #{concurrent_processes} processes creating #{tasks_per_process} tasks each")
      
      # Measure execution time
      {execution_time_ms, results} = TestHelpers.measure_time(fn ->
        # Create concurrent task creation processes
        1..concurrent_processes
        |> Task.async_stream(fn process_id ->
          process_results = 
            Enum.map(1..tasks_per_process, fn task_id ->
              title = "Load test task #{process_id}-#{task_id}"
              case GenServer.call(store_pid, {:add_task, Task.new!(title)}, 10_000) do
                {:ok, task} -> {:success, task}
                error -> {:error, error}
              end
            end)
          
          {process_id, process_results}
        end, 
        max_concurrency: concurrent_processes,
        timeout: 30_000)
        |> Enum.to_list()
      end)

      # Analyze results
      successful_processes = Enum.count(results, fn {:ok, _} -> true; _ -> false end)
      
      IO.puts("✅ Load test completed in #{Float.round(execution_time_ms, 2)}ms")
      IO.puts("📊 Successful processes: #{successful_processes}/#{concurrent_processes}")
      
      # Verify all processes completed successfully
      assert successful_processes == concurrent_processes
      
      # Verify final state
      all_tasks = GenServer.call(store_pid, :get_all_tasks, 10_000)
      stats = GenServer.call(store_pid, :get_stats, 10_000)
      
      assert length(all_tasks) == total_expected_tasks
      assert stats.total == total_expected_tasks
      
      # Performance assertions
      avg_time_per_task = execution_time_ms / total_expected_tasks
      tasks_per_second = total_expected_tasks / (execution_time_ms / 1000)
      
      IO.puts("⚡ Performance metrics:")
      IO.puts("   - Average time per task: #{Float.round(avg_time_per_task, 3)}ms")
      IO.puts("   - Tasks per second: #{Float.round(tasks_per_second, 1)}")
      
      # Assert reasonable performance (adjust thresholds based on requirements)
      assert avg_time_per_task < 10, "Average task creation time too slow: #{avg_time_per_task}ms"
      assert tasks_per_second > 100, "Throughput too low: #{tasks_per_second} tasks/second"
    end

    @tag :load_test
    test "mixed operations under load", %{store_pid: store_pid} do
      # Pre-populate with some tasks
      initial_tasks = TestHelpers.create_bulk_tasks(store_pid, 100)
      
      # Configuration
      operation_count = 1000
      concurrent_workers = 20
      
      IO.puts("\n🔄 Starting mixed operations test: #{operation_count} operations with #{concurrent_workers} workers")
      
      # Define operation types with weights
      operations = [
        {:add_task, 40},      # 40% - Create new tasks
        {:complete_task, 25}, # 25% - Complete existing tasks
        {:get_task, 20},      # 20% - Retrieve specific tasks
        {:update_title, 10},  # 10% - Update task titles
        {:delete_task, 5}     # 5% - Delete tasks
      ]

      {execution_time_ms, operation_results} = TestHelpers.measure_time(fn ->
        1..operation_count
        |> Task.async_stream(fn operation_id ->
          # Select random operation based on weights
          operation_type = select_weighted_operation(operations)
          
          result = case operation_type do
            :add_task ->
              title = "Mixed load task #{operation_id}"
              GenServer.call(store_pid, {:add_task, Task.new!(title)})
            
            :complete_task ->
              tasks = GenServer.call(store_pid, :get_all_tasks)
              if tasks != [] do
                random_task = Enum.random(tasks)
                GenServer.call(store_pid, {:complete_task, random_task.id})
              else
                {:ok, :no_tasks}
              end
            
            :get_task ->
              tasks = GenServer.call(store_pid, :get_all_tasks)
              if tasks != [] do
                random_task = Enum.random(tasks)
                GenServer.call(store_pid, {:get_task, random_task.id})
              else
                nil
              end
            
            :update_title ->
              tasks = GenServer.call(store_pid, :get_all_tasks)
              if tasks != [] do
                random_task = Enum.random(tasks)
                new_title = "Updated task #{operation_id}"
                GenServer.call(store_pid, {:update_task_title, random_task.id, new_title})
              else
                {:ok, :no_tasks}
              end
            
            :delete_task ->
              tasks = GenServer.call(store_pid, :get_all_tasks)
              if tasks != [] && length(tasks) > 50 do # Keep minimum tasks
                random_task = Enum.random(tasks)
                GenServer.call(store_pid, {:delete_task, random_task.id})
              else
                {:ok, :skipped}
              end
          end
          
          {operation_type, operation_id, result}
        end,
        max_concurrency: concurrent_workers,
        timeout: 15_000)
        |> Enum.to_list()
      end)

      # Analyze results
      successful_operations = Enum.count(operation_results, fn {:ok, _} -> true; _ -> false end)
      
      IO.puts("✅ Mixed operations test completed in #{Float.round(execution_time_ms, 2)}ms")
      IO.puts("📊 Successful operations: #{successful_operations}/#{operation_count}")
      
      # Performance metrics
      ops_per_second = operation_count / (execution_time_ms / 1000)
      avg_time_per_op = execution_time_ms / operation_count
      
      IO.puts("⚡ Performance metrics:")
      IO.puts("   - Operations per second: #{Float.round(ops_per_second, 1)}")
      IO.puts("   - Average time per operation: #{Float.round(avg_time_per_op, 3)}ms")
      
      # Verify data integrity
      final_tasks = GenServer.call(store_pid, :get_all_tasks)
      final_stats = GenServer.call(store_pid, :get_stats)
      
      assert final_stats.total == length(final_tasks)
      assert final_stats.completed == Enum.count(final_tasks, & &1.completed)
      assert final_stats.pending == Enum.count(final_tasks, &(not &1.completed))
      
      # Performance assertions
      assert successful_operations >= operation_count * 0.95, "Too many failed operations"
      assert ops_per_second > 50, "Mixed operations throughput too low: #{ops_per_second} ops/second"
    end

    @tag :load_test
    test "memory stability under sustained load", %{store_pid: store_pid} do
      IO.puts("\n💾 Starting memory stability test...")
      
      # Measure initial memory
      initial_memory = :erlang.process_info(store_pid, :memory)[:memory]
      memory_samples = [initial_memory]
      
      # Run sustained operations for several cycles
      cycles = 10
      operations_per_cycle = 500
      
      Enum.each(1..cycles, fn cycle ->
        IO.puts("   Cycle #{cycle}/#{cycles}...")
        
        # Add many tasks
        tasks = TestHelpers.create_bulk_tasks(store_pid, operations_per_cycle)
        
        # Perform random operations
        Enum.each(1..operations_per_cycle, fn _i ->
          case :rand.uniform(3) do
            1 -> # Complete random task
              random_task = Enum.random(tasks)
              GenServer.call(store_pid, {:complete_task, random_task.id})
            
            2 -> # Update random task
              random_task = Enum.random(tasks)
              GenServer.call(store_pid, {:update_task_title, random_task.id, "Updated #{cycle}"})
            
            3 -> # Delete random task (occasionally)
              if :rand.uniform(10) == 1 do
                random_task = Enum.random(tasks)
                GenServer.call(store_pid, {:delete_task, random_task.id})
              end
          end
        end)
        
        # Force garbage collection and measure memory
        :erlang.garbage_collect(store_pid)
        current_memory = :erlang.process_info(store_pid, :memory)[:memory]
        memory_samples = [current_memory | memory_samples]
        
        IO.puts("     Memory: #{div(current_memory, 1024)} KB")
      end)
      
      # Analyze memory growth
      memory_samples = Enum.reverse(memory_samples)
      max_memory = Enum.max(memory_samples)
      final_memory = List.last(memory_samples)
      memory_growth_ratio = final_memory / initial_memory
      
      IO.puts("📈 Memory analysis:")
      IO.puts("   - Initial memory: #{div(initial_memory, 1024)} KB")
      IO.puts("   - Final memory: #{div(final_memory, 1024)} KB")
      IO.puts("   - Max memory: #{div(max_memory, 1024)} KB")
      IO.puts("   - Growth ratio: #{Float.round(memory_growth_ratio, 2)}x")
      
      # Assert memory doesn't grow excessively
      assert memory_growth_ratio < 10.0, "Memory grew too much: #{memory_growth_ratio}x"
      
      # Clean up - delete all tasks and verify memory reduction
      all_tasks = GenServer.call(store_pid, :get_all_tasks)
      Enum.each(all_tasks, fn task ->
        GenServer.call(store_pid, {:delete_task, task.id})
      end)
      
      :erlang.garbage_collect(store_pid)
      cleanup_memory = :erlang.process_info(store_pid, :memory)[:memory]
      cleanup_ratio = cleanup_memory / initial_memory
      
      IO.puts("   - After cleanup: #{div(cleanup_memory, 1024)} KB (#{Float.round(cleanup_ratio, 2)}x initial)")
      
      assert cleanup_ratio < 2.0, "Memory not properly cleaned up: #{cleanup_ratio}x initial"
    end

    @tag :load_test
    test "system recovery after process restart", %{store_pid: store_pid} do
      IO.puts("\n🔄 Testing system recovery...")
      
      # Add initial data
      initial_tasks = TestHelpers.create_bulk_tasks(store_pid, 50)
      initial_count = length(initial_tasks)
      
      IO.puts("   Created #{initial_count} initial tasks")
      
      # Simulate process crash
      Process.exit(store_pid, :kill)
      
      # Wait for process to die
      ref = Process.monitor(store_pid)
      assert_receive {:DOWN, ^ref, :process, ^store_pid, :killed}, 5000
      
      IO.puts("   Process crashed successfully")
      
      # Restart the store (simulating supervisor restart)
      {:ok, new_store_pid} = TaskStore.start_link(name: :recovery_test_store)
      
      # New store should start empty (no persistence)
      new_tasks = GenServer.call(new_store_pid, :get_all_tasks)
      assert new_tasks == []
      
      IO.puts("   New store started with empty state")
      
      # Verify new store is fully functional under load
      recovery_tasks = TestHelpers.create_bulk_tasks(new_store_pid, 100)
      
      # Perform concurrent operations to verify stability
      {recovery_time_ms, _results} = TestHelpers.measure_time(fn ->
        1..200
        |> Task.async_stream(fn _i ->
          case :rand.uniform(3) do
            1 -> 
              task = Task.new!("Recovery task #{:rand.uniform(1000)}")
              GenServer.call(new_store_pid, {:add_task, task})
            
            2 -> 
              if recovery_tasks != [] do
                random_task = Enum.random(recovery_tasks)
                GenServer.call(new_store_pid, {:complete_task, random_task.id})
              end
            
            3 -> 
              GenServer.call(new_store_pid, :get_stats)
          end
        end, max_concurrency: 10)
        |> Enum.to_list()
      end)
      
      final_stats = GenServer.call(new_store_pid, :get_stats)
      
      IO.puts("✅ Recovery test completed in #{Float.round(recovery_time_ms, 2)}ms")
      IO.puts("   Final task count: #{final_stats.total}")
      
      # Verify recovery performance
      assert recovery_time_ms < 5000, "Recovery operations took too long"
      assert final_stats.total > 0, "No tasks after recovery operations"
      
      GenServer.stop(new_store_pid)
    end
  end

  # Helper function for weighted operation selection
  defp select_weighted_operation(operations) do
    total_weight = Enum.sum(Enum.map(operations, fn {_op, weight} -> weight end))
    random_value = :rand.uniform(total_weight)
    
    select_operation(operations, random_value, 0)
  end

  defp select_operation([{operation, weight} | _rest], random_value, acc) 
       when random_value <= acc + weight do
    operation
  end
  
  defp select_operation([{_operation, weight} | rest], random_value, acc) do
    select_operation(rest, random_value, acc + weight)
  end
  
  defp select_operation([], _random_value, _acc) do
    # Fallback - should not happen with correct weights
    :add_task
  end
end