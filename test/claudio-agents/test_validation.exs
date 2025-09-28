#!/usr/bin/env elixir

# Standalone validation test script
defmodule TaskApp.Task do
  @moduledoc """
  Task schema and operations for the task management application.
  """

  defstruct [:id, :title, :completed, :created_at]

  @type t :: %__MODULE__{
          id: String.t(),
          title: String.t(),
          completed: boolean(),
          created_at: DateTime.t()
        }

  @min_title_length 1
  @max_title_length 100

  @doc """
  Creates a new task with the given title.
  Returns {:ok, task} on success or {:error, reason} on validation failure.
  """
  def new(title) when is_binary(title) do
    with :ok <- validate_title(title) do
      {:ok, %__MODULE__{
        id: generate_id(),
        title: String.trim(title),
        completed: false,
        created_at: DateTime.utc_now()
      }}
    end
  end

  def new(nil), do: {:error, :title_required}
  def new(_), do: {:error, :title_must_be_string}

  @doc """
  Validates a task title according to business rules.
  """
  def validate_title(title) when is_binary(title) do
    trimmed = String.trim(title)
    
    cond do
      trimmed == "" ->
        {:error, :title_empty}
      
      String.length(trimmed) < @min_title_length ->
        {:error, :title_too_short}
      
      String.length(trimmed) > @max_title_length ->
        {:error, :title_too_long}
      
      not valid_title_content?(trimmed) ->
        {:error, :title_invalid_content}
      
      true ->
        :ok
    end
  end

  def validate_title(nil), do: {:error, :title_required}
  def validate_title(_), do: {:error, :title_must_be_string}

  @doc """
  Formats validation error reasons into user-friendly messages.
  """
  def format_error(:title_required), do: "Task title is required"
  def format_error(:title_must_be_string), do: "Task title must be text"
  def format_error(:title_empty), do: "Task title cannot be empty"
  def format_error(:title_too_short), do: "Task title must be at least #{@min_title_length} character"
  def format_error(:title_too_long), do: "Task title cannot exceed #{@max_title_length} characters"
  def format_error(:title_invalid_content), do: "Task title contains invalid characters"
  def format_error(reason), do: "Invalid task: #{reason}"

  # Private functions

  defp valid_title_content?(title) do
    # Allow alphanumeric, spaces, and common punctuation including colons and numbers
    String.match?(title, ~r/^[a-zA-Z0-9\s\-_.,!?()\[\]:\/]+$/)
  end

  defp generate_id do
    :crypto.strong_rand_bytes(8) |> Base.encode64() |> binary_part(0, 8)
  end
end

# Run validation tests
alias TaskApp.Task

IO.puts("🧪 Testing Task Validation Implementation\n")

test_cases = [
  # Valid cases
  {"Valid task title", :should_pass},
  {"Task with punctuation!", :should_pass},
  {"Meeting at 3:00 PM (room 101)", :should_pass},
  {"Project-name_v2.0", :should_pass},
  {"What time is the meeting?", :should_pass},
  
  # Invalid cases
  {"", :should_fail},
  {"   ", :should_fail},
  {nil, :should_fail},
  {123, :should_fail},
  {"Task with @ symbol", :should_fail},
  {"Task with <script> tag", :should_fail},
  {String.duplicate("a", 101), :should_fail},
]

results = for {input, expected} <- test_cases do
  result = Task.new(input)
  
  case {result, expected} do
    {{:ok, task}, :should_pass} ->
      IO.puts("✅ PASS: '#{inspect(input)}' -> '#{task.title}'")
      :pass
    
    {{:error, reason}, :should_fail} ->
      IO.puts("✅ PASS: '#{inspect(input)}' -> #{Task.format_error(reason)}")
      :pass
    
    {{:ok, _task}, :should_fail} ->
      IO.puts("❌ FAIL: '#{inspect(input)}' should have failed but passed")
      :fail
    
    {{:error, reason}, :should_pass} ->
      IO.puts("❌ FAIL: '#{inspect(input)}' should have passed but failed: #{Task.format_error(reason)}")
      :fail
  end
end

passed = Enum.count(results, &(&1 == :pass))
total = length(test_cases)

IO.puts("\n📊 Test Results: #{passed}/#{total} passed")

if passed == total do
  IO.puts("🎉 All validation tests passed! Implementation is working correctly.")
  System.halt(0)
else
  IO.puts("❌ Some tests failed. Implementation needs review.")
  System.halt(1)
end