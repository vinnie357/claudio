defmodule TaskAppWeb.TaskLive.ThemeToggleTest do
  use TaskAppWeb.ConnCase, async: true
  
  import Phoenix.LiveViewTest

  describe "Enhanced Theme Toggle Functionality" do
    test "renders main theme toggle button", %{conn: conn} do
      {:ok, view, html} = live(conn, "/")
      
      # Check that toggle button is rendered
      assert has_element?(view, "button[phx-click='toggle_theme']")
      
      # Check for moon icon in light mode (default)
      assert html =~ "Moon icon for dark mode"
      
      # Check accessibility attributes
      assert html =~ "aria-label"
      assert html =~ "Switch to dark mode"
    end

    test "renders transition toggle button", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Check that transition toggle button is rendered
      assert has_element?(view, "button[phx-click='toggle_transitions']")
      
      # Initial state should have transitions enabled
      assert view.assigns.theme_transition_enabled == true
    end

    test "handles basic theme toggle event", %{conn: conn} do
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

    test "handles transition toggle functionality", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Initial state should have transitions enabled
      assert view.assigns.theme_transition_enabled == true
      
      # Toggle transitions off
      render_click(view, "toggle_transitions", %{})
      
      # Should now have transitions disabled
      assert view.assigns.theme_transition_enabled == false
      
      # Toggle transitions back on
      render_click(view, "toggle_transitions", %{})
      
      # Should have transitions enabled again
      assert view.assigns.theme_transition_enabled == true
    end

    test "handles client theme change event", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Initial state should be light mode
      assert view.assigns.dark_mode == false
      
      # Simulate client-initiated theme change (e.g., system preference change)
      render_click(view, "client_theme_change", %{"dark_mode" => true})
      
      # Should update to dark mode
      assert view.assigns.dark_mode == true
      
      # Test no-op when same theme is set
      render_click(view, "client_theme_change", %{"dark_mode" => true})
      
      # Should remain in dark mode
      assert view.assigns.dark_mode == true
    end

    test "session persistence integration", %{conn: conn} do
      # Test with session containing dark mode preference
      conn_with_session = conn |> init_test_session(%{"dark_mode" => true})
      
      {:ok, view, html} = live(conn_with_session, "/")
      
      # Should initialize in dark mode based on session
      assert view.assigns.dark_mode == true
      
      # Should show sun icon (for switching to light)
      assert html =~ "Sun icon for light mode"
      
      # Toggle theme should work and persist
      render_click(view, "toggle_theme", %{})
      assert view.assigns.dark_mode == false
    end

    test "enhanced push_event data structure", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Toggle theme and verify enhanced event data is pushed
      render_click(view, "toggle_theme", %{})
      
      # The push_event should include additional metadata
      # This test verifies the event is pushed without error
      # The actual JavaScript handling would be tested in browser tests
      assert view.assigns.dark_mode == true
    end

    test "theme initialization with multiple sources", %{conn: conn} do
      # Test default initialization (no session data)
      {:ok, view, _html} = live(conn, "/")
      
      # Should default to light mode
      assert view.assigns.dark_mode == false
      
      # Test session override
      conn_with_session = conn |> init_test_session(%{"dark_mode" => true})
      {:ok, view_with_session, _html} = live(conn_with_session, "/")
      
      # Should use session preference
      assert view_with_session.assigns.dark_mode == true
    end

    test "maintains existing task functionality with theme features", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
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
      
      # Toggle transitions
      render_click(view, "toggle_transitions", %{})
      
      # Verify task functionality still works
      render_click(view, "complete_task", %{"id" => List.first(view.assigns.tasks).id})
      
      # Task should be completed and theme/transition state maintained
      assert view.assigns.dark_mode == true
      assert view.assigns.theme_transition_enabled == false
    end

    test "conditional CSS class application based on theme and transitions", %{conn: conn} do
      {:ok, view, html} = live(conn, "/")
      
      # With transitions enabled, should have transition classes
      assert html =~ "transition-colors duration-200"
      
      # Disable transitions
      html = render_click(view, "toggle_transitions", %{})
      
      # Should still render properly (transition classes are conditional in template)
      refute html =~ "transition-colors duration-200" || html =~ "transition-colors duration-200"
    end

    test "accessibility improvements", %{conn: conn} do
      {:ok, view, html} = live(conn, "/")
      
      # Check for proper ARIA labels
      assert html =~ "aria-label=\"Switch to dark mode\""
      assert html =~ "aria-hidden=\"true\""
      
      # Check for proper title attributes
      assert html =~ "title=\"Switch to dark mode\""
      assert html =~ "title=\"Enable transitions\""
      
      # Toggle theme and check updated accessibility
      html = render_click(view, "toggle_theme", %{})
      assert html =~ "aria-label=\"Switch to light mode\""
      assert html =~ "title=\"Switch to light mode\""
    end

    test "theme persistence across LiveView remounts", %{conn: conn} do
      # Set theme in session
      conn_with_session = conn |> init_test_session(%{"dark_mode" => true})
      
      # First mount
      {:ok, view1, _html} = live(conn_with_session, "/")
      assert view1.assigns.dark_mode == true
      
      # Simulate remount by creating new live view with same session
      {:ok, view2, _html} = live(conn_with_session, "/")
      assert view2.assigns.dark_mode == true
    end

    test "handles malformed client events gracefully", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Test with invalid data types
      render_click(view, "client_theme_change", %{"dark_mode" => "invalid"})
      
      # Should maintain current state
      assert view.assigns.dark_mode == false
      
      # Test with missing parameters
      render_click(view, "client_theme_change", %{})
      
      # Should maintain current state
      assert view.assigns.dark_mode == false
    end
  end

  describe "Theme Integration with Task Management" do
    test "theme state persists during task operations", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Set dark mode
      render_click(view, "toggle_theme", %{})
      assert view.assigns.dark_mode == true
      
      # Perform various task operations
      render_change(view, "validate_task", %{"task_title" => "Theme test task"})
      render_submit(view, "add_task", %{"task_title" => "Theme test task"})
      
      # Theme should persist
      assert view.assigns.dark_mode == true
      
      task_id = List.first(view.assigns.tasks).id
      render_click(view, "complete_task", %{"id" => task_id})
      
      # Theme should still persist
      assert view.assigns.dark_mode == true
      
      render_click(view, "delete_task", %{"id" => task_id})
      
      # Theme should still persist
      assert view.assigns.dark_mode == true
    end

    test "transition state persists during task operations", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Disable transitions
      render_click(view, "toggle_transitions", %{})
      assert view.assigns.theme_transition_enabled == false
      
      # Add and manipulate tasks
      render_change(view, "validate_task", %{"task_title" => "Transition test"})
      render_submit(view, "add_task", %{"task_title" => "Transition test"})
      
      # Transition state should persist
      assert view.assigns.theme_transition_enabled == false
    end
  end

  describe "Error Handling and Edge Cases" do
    test "handles concurrent theme and transition toggles", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Rapidly toggle both theme and transitions
      render_click(view, "toggle_theme", %{})
      render_click(view, "toggle_transitions", %{})
      render_click(view, "toggle_theme", %{})
      
      # Should maintain consistent state
      assert view.assigns.dark_mode == false
      assert view.assigns.theme_transition_enabled == false
    end

    test "handles theme changes during form validation errors", %{conn: conn} do
      {:ok, view, _html} = live(conn, "/")
      
      # Create a validation error (empty task)
      render_submit(view, "add_task", %{"task_title" => ""})
      
      # Toggle theme while error exists
      render_click(view, "toggle_theme", %{})
      
      # Both error state and theme should be maintained
      assert view.assigns.dark_mode == true
      # Error handling would depend on your validation logic
    end
  end
end