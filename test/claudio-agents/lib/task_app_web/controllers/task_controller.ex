defmodule TaskAppWeb.TaskController do
  use TaskAppWeb, :controller
  alias TaskApp.TaskStore

  def index(conn, _params) do
    tasks = TaskStore.get_all_tasks()
    json(conn, %{tasks: tasks})
  end

  def create(conn, %{"task" => %{"title" => title}}) do
    case TaskStore.add_task(title) do
      {:ok, task} ->
        conn
        |> put_status(:created)
        |> json(%{task: task})
      
      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: reason})
    end
  end

  def show(conn, %{"id" => id}) do
    case TaskStore.get_task(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Task not found"})
      
      task ->
        json(conn, %{task: task})
    end
  end

  def complete(conn, %{"id" => id}) do
    case TaskStore.complete_task(id) do
      {:ok, task} ->
        json(conn, %{task: task})
      
      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Task not found"})
    end
  end

  def delete(conn, %{"id" => id}) do
    case TaskStore.delete_task(id) do
      :ok ->
        send_resp(conn, :no_content, "")
      
      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Task not found"})
    end
  end

  def stats(conn, _params) do
    stats = TaskStore.get_stats()
    json(conn, %{stats: stats})
  end
end