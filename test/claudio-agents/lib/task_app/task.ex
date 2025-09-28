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
  Creates a new task with the given title, raising on validation failure.
  This maintains backwards compatibility with existing code.
  """
  def new!(title) do
    case new(title) do
      {:ok, task} -> task
      {:error, reason} -> raise ArgumentError, format_error(reason)
    end
  end

  @doc """
  Marks a task as completed.
  """
  def complete(%__MODULE__{} = task) do
    %{task | completed: true}
  end

  @doc """
  Marks a task as incomplete.
  """
  def uncomplete(%__MODULE__{} = task) do
    %{task | completed: false}
  end

  @doc """
  Updates the title of a task.
  Returns {:ok, task} on success or {:error, reason} on validation failure.
  """
  def update_title(%__MODULE__{} = task, new_title) do
    with :ok <- validate_title(new_title) do
      {:ok, %{task | title: String.trim(new_title)}}
    end
  end

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