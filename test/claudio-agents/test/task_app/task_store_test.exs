defmodule TaskApp.TaskStoreTest do
  use ExUnit.Case, async: true
  alias TaskApp.{TaskStore, Task}

  setup do
    {:ok, pid} = TaskStore.start_link(name: :"test_store_#{:rand.uniform(1000)}")
    {:ok, store: pid}
  end

  test "starts with empty task list", %{store: store} do
    tasks = GenServer.call(store, :get_all_tasks)
    assert tasks == []
  end

  test "can add a valid task", %{store: store} do
    {:ok, task} = GenServer.call(store, {:add_task, Task.new!("Test task")})
    
    assert task.title == "Test task"
    assert task.completed == false
    
    tasks = GenServer.call(store, :get_all_tasks)
    assert length(tasks) == 1
  end

  test "can add a task through add_task/1", %{store: _store} do
    # Test the client API which handles validation
    {:ok, task} = TaskStore.add_task("Valid task")
    assert task.title == "Valid task"
  end

  test "rejects invalid tasks through add_task/1", %{store: _store} do
    # Test validation through the client API
    assert {:error, :title_empty} = TaskStore.add_task("")
    assert {:error, :title_required} = TaskStore.add_task(nil)
    assert {:error, :title_too_long} = TaskStore.add_task(String.duplicate("a", 101))
    assert {:error, :title_invalid_content} = TaskStore.add_task("Invalid @ title")
  end

  test "can complete a task", %{store: store} do
    {:ok, task} = GenServer.call(store, {:add_task, Task.new!("Test task")})
    {:ok, completed_task} = GenServer.call(store, {:complete_task, task.id})
    
    assert completed_task.completed == true
    assert completed_task.id == task.id
  end

  test "can delete a task", %{store: store} do
    {:ok, task} = GenServer.call(store, {:add_task, Task.new!("Test task")})
    :ok = GenServer.call(store, {:delete_task, task.id})
    
    tasks = GenServer.call(store, :get_all_tasks)
    assert tasks == []
  end

  test "can update task title", %{store: store} do
    {:ok, task} = GenServer.call(store, {:add_task, Task.new!("Original title")})
    {:ok, updated_task} = GenServer.call(store, {:update_task_title, task.id, "Updated title"})
    
    assert updated_task.title == "Updated title"
    assert updated_task.id == task.id
  end

  test "rejects invalid title updates", %{store: store} do
    {:ok, task} = GenServer.call(store, {:add_task, Task.new!("Original title")})
    
    assert {:error, :title_empty} = GenServer.call(store, {:update_task_title, task.id, ""})
    assert {:error, :title_too_long} = GenServer.call(store, {:update_task_title, task.id, String.duplicate("a", 101)})
  end

  test "returns error when completing non-existent task", %{store: store} do
    result = GenServer.call(store, {:complete_task, "non-existent"})
    assert result == {:error, :not_found}
  end

  test "returns error when deleting non-existent task", %{store: store} do
    result = GenServer.call(store, {:delete_task, "non-existent"})
    assert result == {:error, :not_found}
  end

  test "returns error when updating non-existent task", %{store: store} do
    result = GenServer.call(store, {:update_task_title, "non-existent", "New title"})
    assert result == {:error, :not_found}
  end

  test "calculates stats correctly", %{store: store} do
    GenServer.call(store, {:add_task, Task.new!("Task 1")})
    {:ok, task2} = GenServer.call(store, {:add_task, Task.new!("Task 2")})
    GenServer.call(store, {:add_task, Task.new!("Task 3")})
    
    GenServer.call(store, {:complete_task, task2.id})
    
    stats = GenServer.call(store, :get_stats)
    
    assert stats.total == 3
    assert stats.completed == 1
    assert stats.pending == 2
  end
end