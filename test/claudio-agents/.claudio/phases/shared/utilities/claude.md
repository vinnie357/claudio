# Dark Mode Implementation Utilities

You are working with shared utilities for the Dark Mode Implementation project. These utilities provide common functions, patterns, and resources used across multiple phases and tasks.

## Theme State Utilities

### Theme Resolution Function
```elixir
defmodule ThemeUtils do
  @doc """
  Resolves the effective theme based on user preference and system settings.
  """
  def resolve_theme("auto", system_preference), do: system_preference
  def resolve_theme(explicit_theme, _system_preference), do: explicit_theme
  
  @doc """
  Validates theme values and provides safe defaults.
  """
  def validate_theme(theme) when theme in ["light", "dark", "auto"], do: {:ok, theme}
  def validate_theme(_), do: {:error, :invalid_theme}
  
  @doc """
  Safely gets theme with fallback to default.
  """
  def safe_theme(theme) do
    case validate_theme(theme) do
      {:ok, valid_theme} -> valid_theme
      {:error, _} -> "light"
    end
  end
end
```

### JavaScript Theme Utilities
```javascript
// Theme detection and management utilities
export const ThemeUtils = {
  // Detect system preference
  getSystemPreference() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  },
  
  // Listen for system preference changes
  onSystemPreferenceChange(callback) {
    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
    mediaQuery.addEventListener('change', (e) => {
      callback(e.matches ? 'dark' : 'light');
    });
    return mediaQuery;
  },
  
  // Validate theme value
  isValidTheme(theme) {
    return ['light', 'dark', 'auto'].includes(theme);
  },
  
  // Safe theme getter with fallback
  safeTheme(theme) {
    return this.isValidTheme(theme) ? theme : 'light';
  }
};
```

## CSS Utility Classes

### Custom Dark Mode Classes
```css
/* Additional utility classes for dark mode */
.theme-transition {
  transition: background-color 0.2s ease-in-out, 
              border-color 0.2s ease-in-out, 
              color 0.2s ease-in-out;
}

.theme-bg {
  @apply bg-white dark:bg-gray-900;
}

.theme-text {
  @apply text-gray-900 dark:text-white;
}

.theme-border {
  @apply border-gray-200 dark:border-gray-700;
}

.theme-card {
  @apply bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700;
}
```

### Accessibility Utilities
```css
/* High contrast mode utilities */
@media (prefers-contrast: high) {
  .theme-text {
    @apply text-black dark:text-white;
  }
  
  .theme-border {
    @apply border-black dark:border-white;
  }
}

/* Reduced motion utilities */
@media (prefers-reduced-motion: reduce) {
  .theme-transition {
    transition: none;
  }
}
```

## Testing Utilities

### Phoenix LiveView Test Helpers
```elixir
defmodule ThemeTestUtils do
  @doc """
  Helper to test theme state in LiveView components.
  """
  def assert_theme_state(view, expected_theme) do
    assert has_element?(view, "[data-theme='#{expected_theme}']")
  end
  
  @doc """
  Helper to simulate theme change events.
  """
  def change_theme(view, theme) do
    render_click(view, "theme_change", %{"theme" => theme})
  end
  
  @doc """
  Helper to test localStorage integration.
  """
  def with_theme_storage(theme, callback) do
    # Setup localStorage mock with theme
    callback.()
    # Cleanup
  end
end
```

### JavaScript Testing Utilities
```javascript
// Testing utilities for theme functionality
export const ThemeTestUtils = {
  // Mock localStorage for testing
  mockLocalStorage() {
    const storage = {};
    return {
      getItem: (key) => storage[key] || null,
      setItem: (key, value) => storage[key] = value,
      removeItem: (key) => delete storage[key],
      clear: () => Object.keys(storage).forEach(key => delete storage[key])
    };
  },
  
  // Mock media query for testing
  mockMediaQuery(matches = false) {
    return {
      matches,
      addEventListener: jest.fn(),
      removeEventListener: jest.fn()
    };
  },
  
  // Helper to test theme class application
  hasThemeClass(element, theme) {
    return element.classList.contains(`theme-${theme}`) || 
           (theme === 'dark' && element.classList.contains('dark'));
  }
};
```

## Configuration Utilities

### Theme Configuration Object
```elixir
defmodule ThemeConfig do
  @themes %{
    light: %{
      name: "Light",
      icon: "sun",
      description: "Light theme for bright environments"
    },
    dark: %{
      name: "Dark", 
      icon: "moon",
      description: "Dark theme for low-light environments"
    },
    auto: %{
      name: "Auto",
      icon: "computer",
      description: "Automatically switch based on system preference"
    }
  }
  
  def get_theme_info(theme), do: Map.get(@themes, String.to_atom(theme))
  def all_themes, do: @themes
  def theme_names, do: Map.keys(@themes)
end
```

## Performance Utilities

### Debouncing for Theme Changes
```javascript
export const performanceUtils = {
  // Debounce function for theme changes
  debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
      const later = () => {
        clearTimeout(timeout);
        func(...args);
      };
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
    };
  },
  
  // Throttle function for scroll-based theme changes
  throttle(func, limit) {
    let inThrottle;
    return function() {
      const args = arguments;
      const context = this;
      if (!inThrottle) {
        func.apply(context, args);
        inThrottle = true;
        setTimeout(() => inThrottle = false, limit);
      }
    };
  }
};
```

## Error Handling Utilities

### Theme Error Recovery
```elixir
defmodule ThemeErrorHandler do
  require Logger
  
  @doc """
  Safely handles theme operations with logging and recovery.
  """
  def safe_theme_operation(operation, fallback \\ "light") do
    try do
      operation.()
    rescue
      error ->
        Logger.warn("Theme operation failed: #{inspect(error)}")
        fallback
    end
  end
  
  @doc """
  Logs theme-related errors for debugging.
  """
  def log_theme_error(error, context) do
    Logger.error("Theme error in #{context}: #{inspect(error)}")
  end
end
```

## Common Patterns

### LiveView Theme Hook Pattern
```elixir
# Standard pattern for integrating theme hooks
def mount(_params, _session, socket) do
  {:ok, 
   socket
   |> assign(:theme, "auto")
   |> assign(:show_theme_menu, false)}
end

def handle_event("theme_change", %{"theme" => theme}, socket) do
  with {:ok, valid_theme} <- ThemeUtils.validate_theme(theme) do
    {:noreply, 
     socket
     |> assign(:theme, valid_theme)
     |> push_event("theme_save", %{theme: valid_theme})}
  else
    {:error, _} ->
      {:noreply, socket}
  end
end
```

### Component Theme Integration Pattern
```heex
<!-- Standard pattern for theme-aware components -->
<div class={"theme-card theme-transition #{if @theme == "dark", do: "dark", else: ""}"}>
  <!-- Component content -->
</div>
```

These utilities are available for use across all phases and tasks. They provide tested, consistent implementations of common theme-related functionality.