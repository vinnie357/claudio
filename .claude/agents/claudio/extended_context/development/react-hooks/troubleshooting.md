# React Hooks Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Infinite Re-renders with useEffect
**Symptoms**: 
- Browser freezes or becomes unresponsive
- Console shows "Maximum update depth exceeded" error
- Component renders continuously in a loop

**Diagnosis**: 
- Check useEffect dependencies array for missing or incorrect dependencies
- Look for objects or functions being recreated on every render
- Verify that useEffect isn't updating state that triggers the effect

**Solution**: 
```javascript
// ❌ Problematic - missing dependency
useEffect(() => {
  fetchData(userId);
}, []); // userId should be in dependencies

// ❌ Problematic - object recreated every render
const options = { userId, includeDetails: true };
useEffect(() => {
  fetchData(options);
}, [options]); // options is always new

// ✅ Correct solutions
// Option 1: Include all dependencies
useEffect(() => {
  fetchData(userId);
}, [userId]);

// Option 2: Memoize complex dependencies
const options = useMemo(() => ({
  userId,
  includeDetails: true
}), [userId]);

useEffect(() => {
  fetchData(options);
}, [options]);

// Option 3: Move object inside effect
useEffect(() => {
  const options = { userId, includeDetails: true };
  fetchData(options);
}, [userId]);
```

**Prevention**: 
- Always include all dependencies in useEffect arrays
- Use ESLint rule react-hooks/exhaustive-deps
- Memoize complex objects and functions used in dependencies

### Issue 2: Stale Closure Problem
**Symptoms**: 
- State values inside callbacks show old/stale values
- Event handlers not reflecting current state
- Async operations using outdated state

**Diagnosis**: 
- Check if callbacks are capturing state from previous renders
- Look for missing dependencies in useCallback/useMemo
- Verify async operations aren't using stale state

**Solution**: 
```javascript
// ❌ Problematic - stale closure
function Counter() {
  const [count, setCount] = useState(0);
  
  useEffect(() => {
    const timer = setInterval(() => {
      setCount(count + 1); // count is stale
    }, 1000);
    return () => clearInterval(timer);
  }, []); // Missing count dependency
}

// ✅ Solutions
// Option 1: Use functional update
useEffect(() => {
  const timer = setInterval(() => {
    setCount(prev => prev + 1); // Always current
  }, 1000);
  return () => clearInterval(timer);
}, []); // No dependencies needed

// Option 2: Include dependencies
useEffect(() => {
  const timer = setInterval(() => {
    setCount(count + 1);
  }, 1000);
  return () => clearInterval(timer);
}, [count]); // Include count dependency

// Option 3: Use useRef for mutable values
const countRef = useRef(count);
countRef.current = count;

useEffect(() => {
  const timer = setInterval(() => {
    setCount(countRef.current + 1);
  }, 1000);
  return () => clearInterval(timer);
}, []);
```

**Prevention**: 
- Use functional state updates when possible
- Include all dependencies in hook arrays
- Use useRef for mutable values that don't trigger re-renders

### Issue 3: Context Re-render Performance Issues
**Symptoms**: 
- Multiple components re-rendering unnecessarily
- App becomes sluggish with context updates
- Expensive operations running on every context change

**Diagnosis**: 
- Check if context value is being recreated on every render
- Verify if components are subscribing to more context data than needed
- Look for expensive operations in context consumers

**Solution**: 
```javascript
// ❌ Problematic - value recreated every render
function UserProvider({ children }) {
  const [user, setUser] = useState(null);
  const [preferences, setPreferences] = useState({});
  
  return (
    <UserContext.Provider value={{
      user,
      setUser,
      preferences,
      setPreferences
    }}>
      {children}
    </UserContext.Provider>
  );
}

// ✅ Solutions
// Option 1: Memoize context value
function UserProvider({ children }) {
  const [user, setUser] = useState(null);
  const [preferences, setPreferences] = useState({});
  
  const value = useMemo(() => ({
    user,
    setUser,
    preferences,
    setPreferences
  }), [user, preferences]);
  
  return (
    <UserContext.Provider value={value}>
      {children}
    </UserContext.Provider>
  );
}

// Option 2: Split contexts by concern
const UserContext = createContext();
const PreferencesContext = createContext();

function CombinedProvider({ children }) {
  const [user, setUser] = useState(null);
  const [preferences, setPreferences] = useState({});
  
  return (
    <UserContext.Provider value={useMemo(() => ({ user, setUser }), [user])}>
      <PreferencesContext.Provider value={useMemo(() => ({ preferences, setPreferences }), [preferences])}>
        {children}
      </PreferencesContext.Provider>
    </UserContext.Provider>
  );
}
```

**Prevention**: 
- Memoize context values to prevent unnecessary re-renders
- Split large contexts into smaller, focused ones
- Use React.memo for expensive context consumers

### Issue 4: Memory Leaks with Event Listeners and Subscriptions
**Symptoms**: 
- Memory usage increases over time
- Event listeners firing after component unmount
- WebSocket connections not closing properly

**Diagnosis**: 
- Check if useEffect cleanup functions are properly implemented
- Look for event listeners, timers, or subscriptions without cleanup
- Verify async operations aren't updating state after unmount

**Solution**: 
```javascript
// ❌ Problematic - no cleanup
useEffect(() => {
  const handleResize = () => {
    setWindowWidth(window.innerWidth);
  };
  window.addEventListener('resize', handleResize);
  // Missing cleanup\!
}, []);

// ✅ Correct - with cleanup
useEffect(() => {
  const handleResize = () => {
    setWindowWidth(window.innerWidth);
  };
  
  window.addEventListener('resize', handleResize);
  
  return () => {
    window.removeEventListener('resize', handleResize);
  };
}, []);

// WebSocket cleanup example
useEffect(() => {
  const ws = new WebSocket('ws://localhost:8080');
  
  ws.onmessage = (event) => {
    setMessages(prev => [...prev, event.data]);
  };
  
  return () => {
    ws.close();
  };
}, []);

// Async operation with abort
useEffect(() => {
  const controller = new AbortController();
  
  async function fetchData() {
    try {
      const response = await fetch('/api/data', {
        signal: controller.signal
      });
      const data = await response.json();
      setData(data);
    } catch (error) {
      if (error.name \!== 'AbortError') {
        setError(error.message);
      }
    }
  }
  
  fetchData();
  
  return () => {
    controller.abort();
  };
}, []);
```

**Prevention**: 
- Always return cleanup functions from useEffect when needed
- Use AbortController for fetch requests
- Clear timers and intervals in cleanup functions

### Issue 5: Testing Hooks with Async Operations
**Symptoms**: 
- Tests failing intermittently
- "Can't perform a React state update on an unmounted component" warnings
- Async hooks not updating properly in tests

**Diagnosis**: 
- Check if tests are waiting for async operations to complete
- Look for missing act() wrappers around state updates
- Verify mocks are properly configured for async operations

**Solution**: 
```javascript
// ❌ Problematic test
test('should fetch data', () => {
  const { result } = renderHook(() => useApi('/api/data'));
  
  expect(result.current.loading).toBe(true);
  expect(result.current.data).toBe(null);
  // Test fails - async operation not complete
});

// ✅ Correct async testing
test('should fetch data', async () => {
  // Mock the fetch
  global.fetch = jest.fn(() =>
    Promise.resolve({
      ok: true,
      json: () => Promise.resolve({ id: 1, name: 'Test' })
    })
  );
  
  const { result } = renderHook(() => useApi('/api/data'));
  
  expect(result.current.loading).toBe(true);
  expect(result.current.data).toBe(null);
  
  // Wait for async operation
  await waitFor(() => {
    expect(result.current.loading).toBe(false);
  });
  
  expect(result.current.data).toEqual({ id: 1, name: 'Test' });
  expect(result.current.error).toBe(null);
});

// Testing state updates with act()
test('should increment counter', () => {
  const { result } = renderHook(() => useCounter());
  
  expect(result.current.count).toBe(0);
  
  act(() => {
    result.current.increment();
  });
  
  expect(result.current.count).toBe(1);
});
```

**Prevention**: 
- Always use waitFor for async operations in tests
- Wrap state updates in act() when testing
- Properly mock external dependencies

## Advanced Troubleshooting

### Performance Issues

**React DevTools Profiler Usage**:
1. Install React DevTools browser extension
2. Open DevTools → Profiler tab
3. Start recording interactions
4. Identify components with excessive renders
5. Look for expensive operations in flame graph

**Common Performance Bottlenecks**:
```javascript
// ❌ Expensive operations in render
function ExpensiveComponent({ data }) {
  const processedData = data.map(item => ({
    ...item,
    computed: heavyComputation(item) // Runs on every render
  }));
  
  return <div>{processedData.map(item => <Item key={item.id} data={item} />)}</div>;
}

// ✅ Memoized expensive operations
function ExpensiveComponent({ data }) {
  const processedData = useMemo(() => 
    data.map(item => ({
      ...item,
      computed: heavyComputation(item)
    })), [data]
  );
  
  return <div>{processedData.map(item => <Item key={item.id} data={item} />)}</div>;
}
```

### Integration Problems

**Context Provider Wrapping Issues**:
```javascript
// ❌ Missing provider
function App() {
  return <ComponentThatUsesContext />; // Will throw error
}

// ✅ Proper provider wrapping
function App() {
  return (
    <MyContextProvider>
      <ComponentThatUsesContext />
    </MyContextProvider>
  );
}
```

**Custom Hook Integration**:
```javascript
// ❌ Using hooks outside components
const data = useApi('/api/data'); // Error: can't use outside component

// ✅ Proper hook usage
function MyComponent() {
  const data = useApi('/api/data');
  return <div>{data.loading ? 'Loading...' : data.data}</div>;
}
```

### Edge Cases

**Conditional Hook Usage**:
```javascript
// ❌ Conditional hooks violate rules
function MyComponent({ shouldFetch }) {
  if (shouldFetch) {
    const data = useApi('/api/data'); // Violates rules of hooks
  }
  return <div>Component</div>;
}

// ✅ Conditional logic inside hooks
function MyComponent({ shouldFetch }) {
  const data = useApi(shouldFetch ? '/api/data' : null);
  return <div>Component</div>;
}

// Custom hook handling conditional logic
function useApi(url) {
  const [data, setData] = useState(null);
  
  useEffect(() => {
    if (\!url) return;
    
    fetch(url).then(res => res.json()).then(setData);
  }, [url]);
  
  return data;
}
```

**State Batching in React 18**:
```javascript
// React 18 automatic batching
function handleClick() {
  setCount(c => c + 1);
  setFlag(f => \!f);
  // Batched automatically in React 18
}

// For React 17 and below
import { unstable_batchedUpdates } from 'react-dom';

function handleClick() {
  unstable_batchedUpdates(() => {
    setCount(c => c + 1);
    setFlag(f => \!f);
  });
}
```

## Diagnostic Tools

### React DevTools
- **Components Tab**: Inspect hook state and props
- **Profiler Tab**: Analyze render performance
- **Timeline**: Track state changes over time

### Browser DevTools
- **Console**: Check for hook-related warnings
- **Performance Tab**: Profile JavaScript execution
- **Memory Tab**: Detect memory leaks

### ESLint Rules
```json
{
  "extends": ["react-app"],
  "rules": {
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn"
  }
}
```

### Custom Debugging Hooks
```javascript
// Debug hook for tracking re-renders
function useWhyDidYouUpdate(name, props) {
  const previous = useRef();
  
  useEffect(() => {
    if (previous.current) {
      const allKeys = Object.keys({ ...previous.current, ...props });
      const changes = {};
      
      allKeys.forEach(key => {
        if (previous.current[key] \!== props[key]) {
          changes[key] = {
            from: previous.current[key],
            to: props[key]
          };
        }
      });
      
      if (Object.keys(changes).length) {
        console.log('[why-did-you-update]', name, changes);
      }
    }
    
    previous.current = props;
  });
}

// Usage
function MyComponent(props) {
  useWhyDidYouUpdate('MyComponent', props);
  // ... component logic
}
```

## When to Escalate

### Signs that expert help is needed:
- Performance issues persist after profiling and optimization
- Memory leaks continue despite proper cleanup implementation  
- Complex state synchronization issues across multiple contexts
- Integration problems with third-party libraries and hooks
- Testing strategies failing for complex async hook patterns
- Architecture decisions around state management at scale

### Before escalating, ensure you have:
- Profiler data showing specific performance bottlenecks
- Minimal reproduction case of the issue
- Evidence of attempted solutions and their results
- Clear description of expected vs actual behavior
- Information about React version and related dependencies

### Expert consultation areas:
- Custom hook architecture for large applications
- Advanced performance optimization strategies
- Complex testing scenarios with multiple async operations
- Integration patterns with external state management libraries
- Migration strategies from class components to hooks
EOF < /dev/null