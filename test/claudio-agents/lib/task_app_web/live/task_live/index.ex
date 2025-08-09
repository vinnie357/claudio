defmodule TaskAppWeb.TaskLive.Index do
  use TaskAppWeb, :live_view
  alias TaskApp.{TaskStore, Task}

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: TaskStore.start_link()
    
    {:ok, 
     socket
     |> assign(:tasks, TaskStore.get_all_tasks())
     |> assign(:stats, TaskStore.get_stats())
     |> assign(:new_task_title, "")
     |> assign(:error_message, nil)}
  end

  @impl true
  def handle_event("add_task", %{"task_title" => title}, socket) do
    case TaskStore.add_task(title) do
      {:ok, _task} ->
        {:noreply, 
         socket
         |> assign(:tasks, TaskStore.get_all_tasks())
         |> assign(:stats, TaskStore.get_stats())
         |> assign(:new_task_title, "")
         |> assign(:error_message, nil)}
      
      {:error, reason} ->
        error_message = Task.format_error(reason)
        
        {:noreply, 
         socket
         |> assign(:error_message, error_message)}
    end
  end

  def handle_event("complete_task", %{"id" => id}, socket) do
    {:ok, _task} = TaskStore.complete_task(id)
    
    {:noreply, 
     socket
     |> assign(:tasks, TaskStore.get_all_tasks())
     |> assign(:stats, TaskStore.get_stats())}
  end

  def handle_event("delete_task", %{"id" => id}, socket) do
    :ok = TaskStore.delete_task(id)
    
    {:noreply, 
     socket
     |> assign(:tasks, TaskStore.get_all_tasks())
     |> assign(:stats, TaskStore.get_stats())}
  end

  def handle_event("validate_task", %{"task_title" => title}, socket) do
    # Clear error message when user starts typing
    error_message = if socket.assigns.error_message && title != socket.assigns.new_task_title do
      nil
    else
      socket.assigns.error_message
    end
    
    {:noreply, 
     socket
     |> assign(:new_task_title, title)
     |> assign(:error_message, error_message)}
  end

  def handle_event("clear_error", _params, socket) do
    {:noreply, assign(socket, :error_message, nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto p-6">
      <header class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Task Manager</h1>
        <p class="text-gray-600 dark:text-gray-400 mt-2">Organize your tasks efficiently</p>
      </header>

      <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 mb-6">
        <form phx-submit="add_task" class="space-y-3">
          <div class="flex gap-3">
            <div class="flex-1">
              <input
                type="text"
                name="task_title"
                value={@new_task_title}
                phx-change="validate_task"
                placeholder="Enter a new task..."
                class={"px-4 py-2 w-full border rounded-lg focus:ring-2 focus:ring-blue-500 dark:bg-gray-700 dark:text-white #{if @error_message, do: "border-red-500 dark:border-red-400", else: "border-gray-300 dark:border-gray-600"}"}
                maxlength="100"
              />
              <%= if @error_message do %>
                <div class="flex items-center justify-between mt-2">
                  <p class="text-sm text-red-600 dark:text-red-400">
                    <%= @error_message %>
                  </p>
                  <button
                    type="button"
                    phx-click="clear_error"
                    class="text-red-500 hover:text-red-700 dark:hover:text-red-300"
                  >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              <% end %>
            </div>
            <button
              type="submit"
              disabled={String.trim(@new_task_title) == "" || @error_message != nil}
              class="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              Add Task
            </button>
          </div>
        </form>
      </div>

      <div class="grid md:grid-cols-3 gap-6 mb-6">
        <div class="bg-blue-50 dark:bg-blue-900/20 p-4 rounded-lg text-center">
          <div class="text-2xl font-bold text-blue-600 dark:text-blue-400"><%= @stats.total %></div>
          <div class="text-blue-800 dark:text-blue-300">Total Tasks</div>
        </div>
        <div class="bg-green-50 dark:bg-green-900/20 p-4 rounded-lg text-center">
          <div class="text-2xl font-bold text-green-600 dark:text-green-400"><%= @stats.completed %></div>
          <div class="text-green-800 dark:text-green-300">Completed</div>
        </div>
        <div class="bg-yellow-50 dark:bg-yellow-900/20 p-4 rounded-lg text-center">
          <div class="text-2xl font-bold text-yellow-600 dark:text-yellow-400"><%= @stats.pending %></div>
          <div class="text-yellow-800 dark:text-yellow-300">Pending</div>
        </div>
      </div>

      <div class="bg-white dark:bg-gray-800 rounded-lg shadow-md">
        <div class="p-6 border-b border-gray-200 dark:border-gray-700">
          <h2 class="text-xl font-semibold text-gray-900 dark:text-white">Your Tasks</h2>
        </div>
        
        <div class="p-6">
          <%= if @tasks == [] do %>
            <div class="text-center py-8 text-gray-500 dark:text-gray-400">
              <p>No tasks yet. Add your first task above!</p>
            </div>
          <% else %>
            <div class="space-y-3">
              <%= for task <- @tasks do %>
                <div class={"flex items-center gap-3 p-3 rounded-lg #{if task.completed, do: "bg-green-50 dark:bg-green-900/20", else: "bg-gray-50 dark:bg-gray-700"}"}>
                  <button
                    phx-click="complete_task"
                    phx-value-id={task.id}
                    class={"w-5 h-5 border-2 rounded #{if task.completed, do: "bg-green-500 border-green-500", else: "border-gray-300 dark:border-gray-600 hover:border-green-400"}"}
                  >
                    <%= if task.completed do %>
                      <svg class="w-3 h-3 text-white mx-auto" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                      </svg>
                    <% end %>
                  </button>
                  
                  <div class="flex-1">
                    <span class={"#{if task.completed, do: "line-through text-gray-500 dark:text-gray-400", else: "text-gray-900 dark:text-white"}"}>
                      <%= task.title %>
                    </span>
                  </div>
                  
                  <button
                    phx-click="delete_task"
                    phx-value-id={task.id}
                    class="text-red-500 hover:text-red-700 dark:hover:text-red-400"
                  >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                    </svg>
                  </button>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end