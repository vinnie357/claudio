defmodule TaskApp.TaskValidationTest do
  use ExUnit.Case, async: true
  alias TaskApp.Task

  describe "new/1 validation" do
    test "creates task with valid title" do
      assert {:ok, task} = Task.new("Buy groceries")
      assert task.title == "Buy groceries"
      assert task.completed == false
      assert is_binary(task.id)
    end

    test "trims whitespace from title" do
      assert {:ok, task} = Task.new("  Clean house  ")
      assert task.title == "Clean house"
    end

    test "rejects empty string" do
      assert {:error, :title_empty} = Task.new("")
    end

    test "rejects whitespace-only string" do
      assert {:error, :title_empty} = Task.new("   ")
    end

    test "rejects nil title" do
      assert {:error, :title_required} = Task.new(nil)
    end

    test "rejects non-string title" do
      assert {:error, :title_must_be_string} = Task.new(123)
      assert {:error, :title_must_be_string} = Task.new(%{title: "test"})
    end

    test "rejects title that's too long" do
      long_title = String.duplicate("a", 101)
      assert {:error, :title_too_long} = Task.new(long_title)
    end

    test "accepts maximum length title" do
      max_title = String.duplicate("a", 100)
      assert {:ok, task} = Task.new(max_title)
      assert task.title == max_title
    end

    test "rejects title with invalid characters" do
      assert {:error, :title_invalid_content} = Task.new("Task with <script>")
      assert {:error, :title_invalid_content} = Task.new("Task with @ symbol")
      assert {:error, :title_invalid_content} = Task.new("Task with # hashtag")
    end

    test "accepts title with allowed punctuation" do
      valid_titles = [
        "Buy groceries, milk, and bread!",
        "Meeting at 3:00 PM (conference room)",
        "Project-name_v2.0",
        "What time is it?"
      ]

      for title <- valid_titles do
        assert {:ok, _task} = Task.new(title), "Failed for title: #{title}"
      end
    end
  end

  describe "new!/1 backwards compatibility" do
    test "returns task directly for valid input" do
      task = Task.new!("Valid task")
      assert task.title == "Valid task"
      assert task.completed == false
    end

    test "raises ArgumentError for invalid input" do
      assert_raise ArgumentError, "Task title is required", fn ->
        Task.new!(nil)
      end

      assert_raise ArgumentError, "Task title cannot be empty", fn ->
        Task.new!("")
      end

      assert_raise ArgumentError, "Task title cannot exceed 100 characters", fn ->
        Task.new!(String.duplicate("a", 101))
      end
    end
  end

  describe "validate_title/1" do
    test "validates various title conditions" do
      assert :ok = Task.validate_title("Valid title")
      assert {:error, :title_empty} = Task.validate_title("")
      assert {:error, :title_empty} = Task.validate_title("   ")
      assert {:error, :title_required} = Task.validate_title(nil)
      assert {:error, :title_must_be_string} = Task.validate_title(123)
      assert {:error, :title_too_long} = Task.validate_title(String.duplicate("a", 101))
      assert {:error, :title_invalid_content} = Task.validate_title("Invalid @ content")
    end
  end

  describe "format_error/1" do
    test "formats error reasons into user-friendly messages" do
      assert Task.format_error(:title_required) == "Task title is required"
      assert Task.format_error(:title_empty) == "Task title cannot be empty"
      assert Task.format_error(:title_too_long) == "Task title cannot exceed 100 characters"
      assert Task.format_error(:title_invalid_content) == "Task title contains invalid characters"
      assert Task.format_error(:unknown) == "Invalid task: unknown"
    end
  end

  describe "update_title/2 validation" do
    setup do
      {:ok, task} = Task.new("Original title")
      {:ok, task: task}
    end

    test "updates title with valid input", %{task: task} do
      assert {:ok, updated} = Task.update_title(task, "New title")
      assert updated.title == "New title"
      assert updated.id == task.id
    end

    test "rejects invalid title updates", %{task: task} do
      assert {:error, :title_empty} = Task.update_title(task, "")
      assert {:error, :title_too_long} = Task.update_title(task, String.duplicate("a", 101))
      assert {:error, :title_invalid_content} = Task.update_title(task, "Bad @ content")
    end

    test "trims whitespace in updated title", %{task: task} do
      assert {:ok, updated} = Task.update_title(task, "  Trimmed title  ")
      assert updated.title == "Trimmed title"
    end
  end
end