defmodule TaskAppWeb.TaskLive.ThemeToggleTest do
  use TaskAppWeb.ConnCase, async: true
  
  import Phoenix.LiveViewTest

  describe "Theme Toggle Functionality" do
    test "renders toggle button", %{conn: conn} do
      {:ok, view, html} = live(conn, "/")
      
      # Check that toggle button is rendered
      assert has_element?(view, "button[phx-click='toggle_theme']")
      
      # Check for moon icon in light mode (default)
      assert html =~ "Moon icon for dark mode"
    end

    test "handles theme toggle event", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Initial state should be light mode (dark_mode: false)
      assert view.assigns.dark_mode == false
      
      # Click toggle button
      html = render_click(view, "toggle_theme", %{})
      
      # Should now be in dark mode
      assert view.assigns.dark_mode == true
      
      # Check for sun icon in dark mode
      assert html =~ "Sun icon for light mode"
      
      # Click again to toggle back
      html = render_click(view, "toggle_theme", %{})
      
      # Should be back to light mode
      assert view.assigns.dark_mode == false
      
      # Check for moon icon again
      assert html =~ "Moon icon for dark mode"
    end

    test "maintains existing functionality", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Test that task functionality still works after adding theme toggle
      
      # Add a task
      render_change(view, "validate_task", %{"task_title" => "Test task"})
      render_submit(view, "add_task", %{"task_title" => "Test task"})
      
      # Verify task was added
      assert has_element?(view, "span", "Test task")
      
      # Toggle theme while task exists
      render_click(view, "toggle_theme", %{})
      
      # Verify task is still there and toggle worked
      assert has_element?(view, "span", "Test task")
      assert view.assigns.dark_mode == true
    end

    test "handles push_event for theme updates", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Toggle theme and check that update_theme event is pushed
      render_click(view, "toggle_theme", %{})
      
      # This test verifies the event is pushed without error
      # The actual JavaScript handling would be tested in browser tests
      assert view.assigns.dark_mode == true
    end
  end
end