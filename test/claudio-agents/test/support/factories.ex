defmodule TaskApp.Factories do
  @moduledoc """
  Test factories for creating test data using ExMachina.
  """
  
  use ExMachina
  alias TaskApp.Task

  def task_factory do
    %Task{
      id: sequence(:task_id, &"task_#{&1}"),
      title: sequence(:title, &"Task #{&1}"),
      completed: false,
      created_at: DateTime.utc_now()
    }
  end

  def completed_task_factory do
    task_factory()
    |> Task.complete()
  end

  def task_with_long_title_factory do
    task_factory()
    |> Map.put(:title, String.duplicate("Long task title ", 5))
  end

  def task_with_special_chars_factory do
    task_factory()
    |> Map.put(:title, "Task with special chars: !@#$%^&*()")
  end

  # Bulk factory methods
  def build_task_list(count \\ 5) do
    build_list(count, :task)
  end

  def build_mixed_task_list(count \\ 10) do
    completed_count = div(count, 3)
    
    completed_tasks = build_list(completed_count, :completed_task)
    pending_tasks = build_list(count - completed_count, :task)
    
    Enum.shuffle(completed_tasks ++ pending_tasks)
  end

  # Helper for creating tasks with specific patterns
  def task_with_title(title) do
    build(:task, title: title)
  end

  def tasks_with_pattern(pattern, count \\ 3) do
    1..count
    |> Enum.map(fn i ->
      build(:task, title: "#{pattern} #{i}")
    end)
  end

  # Performance testing factories
  def bulk_tasks(count) when count > 1000 do
    # For large datasets, use a more efficient approach
    base_time = DateTime.utc_now()
    
    Stream.map(1..count, fn i ->
      %Task{
        id: "bulk_#{i}_#{System.unique_integer()}",
        title: "Bulk Task #{i}",
        completed: rem(i, 4) == 0, # 25% completed
        created_at: DateTime.add(base_time, i, :second)
      }
    end)
    |> Enum.to_list()
  end

  def bulk_tasks(count), do: build_list(count, :task)

  # Validation test data factories
  def invalid_task_data do
    [
      %{title: nil, expected_error: :title_required},
      %{title: "", expected_error: :title_empty},
      %{title: "   ", expected_error: :title_empty},
      %{title: 123, expected_error: :title_must_be_string},
      %{title: String.duplicate("a", 101), expected_error: :title_too_long},
      %{title: "Task @ with @ symbols", expected_error: :title_invalid_content}
    ]
  end

  def valid_task_titles do
    [
      "Simple task",
      "Task with numbers 123",
      "Task-with-dashes",
      "Task_with_underscores",
      "Task with punctuation!?",
      "Task (with parentheses)",
      "Task [with brackets]",
      "Task with colon: description",
      "Task/with/slashes",
      String.duplicate("Valid", 20) # Max length test
    ]
  end

  # LiveView testing helpers
  def socket_assigns_factory do
    %{
      tasks: build_list(3, :task),
      stats: %{total: 3, completed: 1, pending: 2},
      new_task_title: "",
      error_message: nil
    }
  end

  def socket_with_error_factory do
    %{
      tasks: [],
      stats: %{total: 0, completed: 0, pending: 0},
      new_task_title: "Invalid @ title",
      error_message: "Task title contains invalid characters"
    }
  end

  # API testing helpers
  def api_task_params_factory do
    %{"task" => %{"title" => build(:task).title}}
  end

  def invalid_api_params_factory do
    %{"task" => %{"title" => ""}}
  end

  # Performance benchmark data
  def benchmark_scenario(scenario_name) do
    case scenario_name do
      :light_load ->
        %{
          task_count: 100,
          concurrent_operations: 50,
          operation_types: [:add, :complete, :get, :stats]
        }
      
      :medium_load ->
        %{
          task_count: 1000,
          concurrent_operations: 200,
          operation_types: [:add, :complete, :get, :update, :delete, :stats]
        }
      
      :heavy_load ->
        %{
          task_count: 5000,
          concurrent_operations: 500,
          operation_types: [:add, :complete, :get, :update, :delete, :stats, :bulk_get]
        }
      
      :stress_test ->
        %{
          task_count: 10000,
          concurrent_operations: 1000,
          operation_types: [:add, :complete, :get, :update, :delete, :stats, :bulk_get]
        }
    end
  end
end