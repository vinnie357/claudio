defmodule TaskAppWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  during a test are rolled back at the end of the test.
  If you are using PostgreSQL, you can even run database
  tests asynchronously by setting `use MyApp.DataCase, async: true`,
  although this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint TaskAppWeb.Endpoint

      use TaskAppWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import TaskAppWeb.ConnCase
    end
  end

  setup tags do
    # Start TaskStore for each test if needed
    if tags[:start_task_store] do
      {:ok, _} = TaskApp.TaskStore.start_link()
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end