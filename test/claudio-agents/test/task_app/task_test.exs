defmodule TaskApp.TaskTest do
  use ExUnit.Case, async: true
  alias TaskApp.Task

  describe "new!/1 (backwards compatible)" do
    test "creates a task with valid title" do
      task = Task.new!("Buy groceries")
      
      assert task.title == "Buy groceries"
      assert task.completed == false
      assert is_binary(task.id)
      assert %DateTime{} = task.created_at
    end

    test "trims whitespace from title" do
      task = Task.new!("  Clean house  ")
      
      assert task.title == "Clean house"
    end
  end

  describe "complete/1" do
    test "marks task as completed" do
      task = Task.new!("Test task")
      completed_task = Task.complete(task)
      
      assert completed_task.completed == true
      assert completed_task.id == task.id
      assert completed_task.title == task.title
    end
  end

  describe "uncomplete/1" do
    test "marks completed task as incomplete" do
      task = 
        Task.new!("Test task")
        |> Task.complete()
        |> Task.uncomplete()
      
      assert task.completed == false
    end
  end

  describe "update_title/2 (backwards compatible with new! for initial creation)" do
    test "updates task title" do
      task = Task.new!("Old title")
      {:ok, updated_task} = Task.update_title(task, "New title")
      
      assert updated_task.title == "New title"
      assert updated_task.id == task.id
    end

    test "trims whitespace from new title" do
      task = Task.new!("Old title")
      {:ok, updated_task} = Task.update_title(task, "  New title  ")
      
      assert updated_task.title == "New title"
    end
  end
end