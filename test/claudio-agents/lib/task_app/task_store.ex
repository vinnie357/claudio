defmodule TaskApp.TaskStore do
  @moduledoc """
  In-memory task store using GenServer for state management.
  """

  use GenServer
  alias TaskApp.Task

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, Keyword.put_new(opts, :name, __MODULE__))
  end

  def add_task(title) do
    case Task.new(title) do
      {:ok, task} ->
        GenServer.call(__MODULE__, {:add_task, task})
      
      {:error, reason} ->
        {:error, reason}
    end
  end

  def get_all_tasks do
    GenServer.call(__MODULE__, :get_all_tasks)
  end

  def get_task(id) do
    GenServer.call(__MODULE__, {:get_task, id})
  end

  def complete_task(id) do
    GenServer.call(__MODULE__, {:complete_task, id})
  end

  def delete_task(id) do
    GenServer.call(__MODULE__, {:delete_task, id})
  end

  def update_task_title(id, new_title) do
    GenServer.call(__MODULE__, {:update_task_title, id, new_title})
  end

  def get_stats do
    GenServer.call(__MODULE__, :get_stats)
  end

  # Server Callbacks

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:add_task, task}, _from, tasks) do
    new_tasks = Map.put(tasks, task.id, task)
    {:reply, {:ok, task}, new_tasks}
  end

  def handle_call(:get_all_tasks, _from, tasks) do
    task_list = 
      tasks
      |> Map.values()
      |> Enum.sort_by(& &1.created_at, {:desc, DateTime})
    
    {:reply, task_list, tasks}
  end

  def handle_call({:get_task, id}, _from, tasks) do
    task = Map.get(tasks, id)
    {:reply, task, tasks}
  end

  def handle_call({:complete_task, id}, _from, tasks) do
    case Map.get(tasks, id) do
      nil ->
        {:reply, {:error, :not_found}, tasks}
      
      task ->
        updated_task = Task.complete(task)
        new_tasks = Map.put(tasks, id, updated_task)
        {:reply, {:ok, updated_task}, new_tasks}
    end
  end

  def handle_call({:update_task_title, id, new_title}, _from, tasks) do
    case Map.get(tasks, id) do
      nil ->
        {:reply, {:error, :not_found}, tasks}
      
      task ->
        case Task.update_title(task, new_title) do
          {:ok, updated_task} ->
            new_tasks = Map.put(tasks, id, updated_task)
            {:reply, {:ok, updated_task}, new_tasks}
          
          {:error, reason} ->
            {:reply, {:error, reason}, tasks}
        end
    end
  end

  def handle_call({:delete_task, id}, _from, tasks) do
    case Map.pop(tasks, id) do
      {nil, _tasks} ->
        {:reply, {:error, :not_found}, tasks}
      
      {_deleted_task, new_tasks} ->
        {:reply, :ok, new_tasks}
    end
  end

  def handle_call(:get_stats, _from, tasks) do
    total = map_size(tasks)
    completed = tasks |> Map.values() |> Enum.count(& &1.completed)
    
    stats = %{
      total: total,
      completed: completed,
      pending: total - completed
    }
    
    {:reply, stats, tasks}
  end
end