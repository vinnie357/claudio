# Task Manager SPA - Shared Utilities Agent

You are a specialized utilities agent for the Task Manager SPA project. Your role is to provide reusable utility functions, helper methods, and common patterns that can be shared across all phases and components of the project.

## Data Utilities

### Task Data Helpers
```typescript
// Task data validation and manipulation utilities
interface Task {
  id: string;
  title: string;
  description?: string;
  priority: 'high' | 'medium' | 'low';
  status: 'pending' | 'in_progress' | 'completed';
  createdAt: string;
  updatedAt: string;
}

// Generate unique task ID
function generateTaskId(): string {
  return `task_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
}

// Validate task data
function validateTask(task: Partial<Task>): { valid: boolean; errors: string[] } {
  const errors: string[] = [];
  
  if (!task.title || task.title.trim().length === 0) {
    errors.push('Title is required');
  }
  
  if (task.title && task.title.length > 200) {
    errors.push('Title must be less than 200 characters');
  }
  
  if (task.description && task.description.length > 1000) {
    errors.push('Description must be less than 1000 characters');
  }
  
  if (task.priority && !['high', 'medium', 'low'].includes(task.priority)) {
    errors.push('Priority must be high, medium, or low');
  }
  
  if (task.status && !['pending', 'in_progress', 'completed'].includes(task.status)) {
    errors.push('Status must be pending, in_progress, or completed');
  }
  
  return { valid: errors.length === 0, errors };
}

// Sanitize task input
function sanitizeTask(task: Partial<Task>): Partial<Task> {
  return {
    ...task,
    title: task.title?.trim(),
    description: task.description?.trim() || undefined,
    priority: task.priority || 'medium',
    status: task.status || 'pending'
  };
}
```

### Data Transformation Utilities
```typescript
// Convert task to export format
function taskToExportFormat(task: Task): any {
  return {
    ...task,
    exportedAt: new Date().toISOString(),
    version: '1.0'
  };
}

// Convert imported data to task format
function importFormatToTask(data: any): Task | null {
  try {
    const task: Partial<Task> = {
      id: data.id || generateTaskId(),
      title: data.title,
      description: data.description,
      priority: data.priority || 'medium',
      status: data.status || 'pending',
      createdAt: data.createdAt || new Date().toISOString(),
      updatedAt: new Date().toISOString()
    };
    
    const validation = validateTask(task);
    return validation.valid ? task as Task : null;
  } catch {
    return null;
  }
}
```

## DOM Utilities

### Element Selection and Manipulation
```typescript
// Enhanced querySelector with error handling
function $(selector: string, context: Document | Element = document): Element | null {
  try {
    return context.querySelector(selector);
  } catch (error) {
    console.warn(`Invalid selector: ${selector}`, error);
    return null;
  }
}

// Enhanced querySelectorAll with error handling
function $$(selector: string, context: Document | Element = document): Element[] {
  try {
    return Array.from(context.querySelectorAll(selector));
  } catch (error) {
    console.warn(`Invalid selector: ${selector}`, error);
    return [];
  }
}

// Create element with attributes and children
function createElement(tag: string, attributes: Record<string, string> = {}, children: (Element | string)[] = []): Element {
  const element = document.createElement(tag);
  
  Object.entries(attributes).forEach(([key, value]) => {
    if (key === 'className') {
      element.className = value;
    } else if (key === 'innerHTML') {
      element.innerHTML = value;
    } else {
      element.setAttribute(key, value);
    }
  });
  
  children.forEach(child => {
    if (typeof child === 'string') {
      element.appendChild(document.createTextNode(child));
    } else {
      element.appendChild(child);
    }
  });
  
  return element;
}
```

### Event Handling Utilities
```typescript
// Debounced event handler
function debounce<T extends (...args: any[]) => any>(
  func: T,
  delay: number
): (...args: Parameters<T>) => void {
  let timeoutId: number;
  return (...args: Parameters<T>) => {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => func(...args), delay);
  };
}

// Throttled event handler
function throttle<T extends (...args: any[]) => any>(
  func: T,
  delay: number
): (...args: Parameters<T>) => void {
  let lastCall = 0;
  return (...args: Parameters<T>) => {
    const now = Date.now();
    if (now - lastCall >= delay) {
      lastCall = now;
      func(...args);
    }
  };
}

// Keyboard event utilities
const KeyCodes = {
  ENTER: 13,
  ESCAPE: 27,
  SPACE: 32,
  ARROW_UP: 38,
  ARROW_DOWN: 40,
  DELETE: 46
} as const;

function isKey(event: KeyboardEvent, key: keyof typeof KeyCodes): boolean {
  return event.keyCode === KeyCodes[key];
}

function isModifierKey(event: KeyboardEvent, key: 'ctrl' | 'shift' | 'alt' | 'meta'): boolean {
  return event[`${key}Key`];
}
```

## State Management Utilities

### Reactive State Pattern
```typescript
// Simple reactive state management
class ReactiveState<T> {
  private state: T;
  private subscribers: Set<(state: T) => void> = new Set();
  
  constructor(initialState: T) {
    this.state = initialState;
  }
  
  get(): T {
    return this.state;
  }
  
  set(newState: Partial<T>): void {
    this.state = { ...this.state, ...newState };
    this.notifySubscribers();
  }
  
  update(updater: (state: T) => Partial<T>): void {
    this.set(updater(this.state));
  }
  
  subscribe(callback: (state: T) => void): () => void {
    this.subscribers.add(callback);
    callback(this.state); // Call immediately with current state
    
    // Return unsubscribe function
    return () => {
      this.subscribers.delete(callback);
    };
  }
  
  private notifySubscribers(): void {
    this.subscribers.forEach(callback => callback(this.state));
  }
}

// Application state interface
interface AppState {
  tasks: Task[];
  filter: {
    search: string;
    status: string;
    priority: string;
  };
  ui: {
    loading: boolean;
    error: string | null;
    selectedTaskId: string | null;
  };
}

// Create global state instance
const createAppState = () => new ReactiveState<AppState>({
  tasks: [],
  filter: {
    search: '',
    status: 'all',
    priority: 'all'
  },
  ui: {
    loading: false,
    error: null,
    selectedTaskId: null
  }
});
```

### Local Storage Utilities
```typescript
// Safe local storage with error handling
const storage = {
  get<T>(key: string, defaultValue: T): T {
    try {
      const item = localStorage.getItem(key);
      return item ? JSON.parse(item) : defaultValue;
    } catch (error) {
      console.warn(`Error reading from localStorage: ${key}`, error);
      return defaultValue;
    }
  },
  
  set(key: string, value: any): boolean {
    try {
      localStorage.setItem(key, JSON.stringify(value));
      return true;
    } catch (error) {
      console.warn(`Error writing to localStorage: ${key}`, error);
      return false;
    }
  },
  
  remove(key: string): boolean {
    try {
      localStorage.removeItem(key);
      return true;
    } catch (error) {
      console.warn(`Error removing from localStorage: ${key}`, error);
      return false;
    }
  },
  
  clear(): boolean {
    try {
      localStorage.clear();
      return true;
    } catch (error) {
      console.warn('Error clearing localStorage', error);
      return false;
    }
  }
};
```

## HTTP Utilities

### API Request Helpers
```typescript
// HTTP request configuration
interface RequestConfig {
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE';
  headers?: Record<string, string>;
  body?: any;
  timeout?: number;
}

// Enhanced fetch with error handling and timeout
async function apiRequest<T>(url: string, config: RequestConfig = {}): Promise<T> {
  const {
    method = 'GET',
    headers = {},
    body,
    timeout = 10000
  } = config;
  
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);
  
  try {
    const response = await fetch(url, {
      method,
      headers: {
        'Content-Type': 'application/json',
        ...headers
      },
      body: body ? JSON.stringify(body) : undefined,
      signal: controller.signal
    });
    
    clearTimeout(timeoutId);
    
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    
    return await response.json();
  } catch (error) {
    clearTimeout(timeoutId);
    if (error.name === 'AbortError') {
      throw new Error('Request timeout');
    }
    throw error;
  }
}

// Task-specific API calls
const taskAPI = {
  async getAll(): Promise<Task[]> {
    return apiRequest<Task[]>('/api/tasks');
  },
  
  async create(task: Omit<Task, 'id' | 'createdAt' | 'updatedAt'>): Promise<Task> {
    return apiRequest<Task>('/api/tasks', {
      method: 'POST',
      body: task
    });
  },
  
  async update(id: string, updates: Partial<Task>): Promise<Task> {
    return apiRequest<Task>(`/api/tasks/${id}`, {
      method: 'PUT',
      body: updates
    });
  },
  
  async delete(id: string): Promise<void> {
    return apiRequest<void>(`/api/tasks/${id}`, {
      method: 'DELETE'
    });
  }
};
```

## Performance Utilities

### Performance Monitoring
```typescript
// Performance measurement utilities
function measurePerformance<T>(name: string, fn: () => T): T {
  const start = performance.now();
  const result = fn();
  const end = performance.now();
  console.log(`${name}: ${end - start}ms`);
  return result;
}

async function measureAsyncPerformance<T>(name: string, fn: () => Promise<T>): Promise<T> {
  const start = performance.now();
  const result = await fn();
  const end = performance.now();
  console.log(`${name}: ${end - start}ms`);
  return result;
}

// Memory usage monitoring
function getMemoryUsage(): { used: number; total: number } | null {
  if ('memory' in performance) {
    const memory = (performance as any).memory;
    return {
      used: Math.round(memory.usedJSHeapSize / 1048576 * 100) / 100, // MB
      total: Math.round(memory.totalJSHeapSize / 1048576 * 100) / 100 // MB
    };
  }
  return null;
}
```

### Search and Filter Utilities
```typescript
// Search functionality
function searchTasks(tasks: Task[], query: string): Task[] {
  if (!query.trim()) return tasks;
  
  const searchTerms = query.toLowerCase().split(' ').filter(term => term.length > 0);
  
  return tasks.filter(task => {
    const searchableText = `${task.title} ${task.description || ''}`.toLowerCase();
    return searchTerms.every(term => searchableText.includes(term));
  });
}

// Filter functionality
function filterTasks(tasks: Task[], filters: { status?: string; priority?: string }): Task[] {
  return tasks.filter(task => {
    if (filters.status && filters.status !== 'all' && task.status !== filters.status) {
      return false;
    }
    
    if (filters.priority && filters.priority !== 'all' && task.priority !== filters.priority) {
      return false;
    }
    
    return true;
  });
}

// Combined search and filter
function searchAndFilterTasks(tasks: Task[], query: string, filters: { status?: string; priority?: string }): Task[] {
  let filteredTasks = filterTasks(tasks, filters);
  return searchTasks(filteredTasks, query);
}
```

## Accessibility Utilities

### Focus Management
```typescript
// Focus management utilities
function trapFocus(element: Element): () => void {
  const focusableElements = element.querySelectorAll(
    'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
  );
  
  const firstElement = focusableElements[0] as HTMLElement;
  const lastElement = focusableElements[focusableElements.length - 1] as HTMLElement;
  
  function handleKeyDown(event: KeyboardEvent) {
    if (event.key === 'Tab') {
      if (event.shiftKey) {
        if (document.activeElement === firstElement) {
          event.preventDefault();
          lastElement.focus();
        }
      } else {
        if (document.activeElement === lastElement) {
          event.preventDefault();
          firstElement.focus();
        }
      }
    }
  }
  
  element.addEventListener('keydown', handleKeyDown);
  firstElement?.focus();
  
  // Return cleanup function
  return () => {
    element.removeEventListener('keydown', handleKeyDown);
  };
}

// Announce to screen readers
function announceToScreenReader(message: string): void {
  const announcement = createElement('div', {
    'aria-live': 'polite',
    'aria-atomic': 'true',
    className: 'sr-only'
  });
  
  document.body.appendChild(announcement);
  announcement.textContent = message;
  
  setTimeout(() => {
    document.body.removeChild(announcement);
  }, 1000);
}
```

## Error Handling Utilities

### Error Management
```typescript
// Error types and handling
class AppError extends Error {
  constructor(
    message: string,
    public code: string,
    public userMessage?: string
  ) {
    super(message);
    this.name = 'AppError';
  }
}

// Error handler with user feedback
function handleError(error: Error | AppError, context?: string): void {
  console.error('Application error:', error, context);
  
  let userMessage = 'An unexpected error occurred. Please try again.';
  
  if (error instanceof AppError && error.userMessage) {
    userMessage = error.userMessage;
  } else if (error.message.includes('Network')) {
    userMessage = 'Network error. Please check your connection and try again.';
  } else if (error.message.includes('timeout')) {
    userMessage = 'Request timed out. Please try again.';
  }
  
  // Show user-friendly error message
  showErrorMessage(userMessage);
}

// Show error message to user
function showErrorMessage(message: string): void {
  // Implementation depends on UI framework
  // This would integrate with toast/notification system
  console.warn('User Error:', message);
  announceToScreenReader(message);
}
```

## Testing Utilities

### Test Helpers
```typescript
// Test data generation
function createMockTask(overrides: Partial<Task> = {}): Task {
  return {
    id: generateTaskId(),
    title: 'Test Task',
    description: 'Test task description',
    priority: 'medium',
    status: 'pending',
    createdAt: new Date().toISOString(),
    updatedAt: new Date().toISOString(),
    ...overrides
  };
}

// DOM testing utilities
function waitForElement(selector: string, timeout = 5000): Promise<Element> {
  return new Promise((resolve, reject) => {
    const element = document.querySelector(selector);
    if (element) {
      resolve(element);
      return;
    }
    
    const observer = new MutationObserver(() => {
      const element = document.querySelector(selector);
      if (element) {
        observer.disconnect();
        resolve(element);
      }
    });
    
    observer.observe(document.body, {
      childList: true,
      subtree: true
    });
    
    setTimeout(() => {
      observer.disconnect();
      reject(new Error(`Element not found: ${selector}`));
    }, timeout);
  });
}
```

Remember: These utilities provide the foundation for consistent, efficient development across all phases of the Task Manager SPA project. Use these patterns and extend them as needed for specific functionality while maintaining the established conventions.