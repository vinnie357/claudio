# React Hooks Patterns for State Management Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Infinite Re-renders with useEffect

**Symptoms**:
- Browser freezes or becomes unresponsive
- Console shows "Too many re-renders" error
- Component continuously re-renders without user interaction
- Network requests firing repeatedly

**Diagnosis**:
- Check useEffect dependency arrays for missing dependencies
- Look for object or array dependencies that recreate on every render
- Verify that useEffect isn't updating state that triggers itself

**Solution**:
```javascript
// ❌ Problem: Missing dependency or recreated object
useEffect(() => {
  fetchData(filters);
}, []); // Missing 'filters' dependency

// ❌ Problem: Object recreated every render
const filters = { type: 'active', status: 'pending' };
useEffect(() => {
  fetchData(filters);
}, [filters]); // 'filters' object recreates every render

// ✅ Solution: Proper dependency management
useEffect(() => {
  fetchData({ type: 'active', status: 'pending' });
}, [filterType, filterStatus]); // Use primitive dependencies

// ✅ Solution: Use useMemo for complex objects
const filters = useMemo(() => ({
  type: filterType,
  status: filterStatus
}), [filterType, filterStatus]);

useEffect(() => {
  fetchData(filters);
}, [filters]);
```

**Prevention**:
- Always include all dependencies in useEffect arrays
- Use ESLint plugin for React hooks to catch missing dependencies
- Use useMemo for object/array dependencies
- Consider useCallback for function dependencies

### Issue 2: Stale Closures in Event Handlers

**Symptoms**:
- Event handlers use outdated state values
- Callbacks reference old prop values
- State updates don't reflect current state
- Inconsistent behavior in async operations

**Diagnosis**:
- Check if event handlers are defined inside useEffect without proper dependencies
- Look for callbacks passed to child components without useCallback
- Verify that async functions capture current state values

**Solution**:
```javascript
// ❌ Problem: Stale closure captures old state
const [count, setCount] = useState(0);

useEffect(() => {
  const interval = setInterval(() => {
    setCount(count + 1); // Always uses initial count (0)
  }, 1000);
  
  return () => clearInterval(interval);
}, []); // Empty dependency array causes stale closure

// ✅ Solution: Use functional state update
useEffect(() => {
  const interval = setInterval(() => {
    setCount(prev => prev + 1); // Uses current state
  }, 1000);
  
  return () => clearInterval(interval);
}, []); // No dependencies needed

// ✅ Solution: Include dependencies
useEffect(() => {
  const interval = setInterval(() => {
    setCount(count + 1);
  }, 1000);
  
  return () => clearInterval(interval);
}, [count]); // Include count in dependencies
```

**Prevention**:
- Use functional state updates when possible
- Include all used variables in dependency arrays
- Use useCallback for event handlers passed to children
- Consider useRef for mutable values that don't trigger re-renders

### Issue 3: Context Performance Problems

**Symptoms**:
- Entire application re-renders on any context change
- Slow interactions when context value updates
- Child components render unnecessarily
- Performance degradation with context usage growth

**Diagnosis**:
- Check if context value is recreated on every render
- Look for large objects in context that change frequently
- Verify that multiple unrelated values are combined in single context

**Solution**:
```javascript
// ❌ Problem: Context value recreated every render
const AppProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [theme, setTheme] = useState('light');
  
  return (
    <AppContext.Provider value={{
      user, setUser, theme, setTheme // New object every render
    }}>
      {children}
    </AppContext.Provider>
  );
};

// ✅ Solution: Memoize context value
const AppProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [theme, setTheme] = useState('light');
  
  const contextValue = useMemo(() => ({
    user, setUser, theme, setTheme
  }), [user, theme]);
  
  return (
    <AppContext.Provider value={contextValue}>
      {children}
    </AppContext.Provider>
  );
};

// ✅ Better solution: Split contexts
const UserProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const value = useMemo(() => ({ user, setUser }), [user]);
  
  return (
    <UserContext.Provider value={value}>
      {children}
    </UserContext.Provider>
  );
};
```

**Prevention**:
- Split contexts by feature or update frequency
- Memoize context values with useMemo
- Use React.memo for components that consume context
- Consider state co-location to minimize context usage

### Issue 4: useReducer State Mutations

**Symptoms**:
- State updates don't trigger re-renders
- Components don't reflect state changes
- Unexpected behavior in state transitions
- Development tools show state isn't updating

**Diagnosis**:
- Check if reducer is mutating state directly
- Look for array/object mutations instead of immutable updates
- Verify that reducer returns new state objects

**Solution**:
```javascript
// ❌ Problem: Direct state mutation
const reducer = (state, action) => {
  switch (action.type) {
    case 'ADD_ITEM':
      state.items.push(action.payload); // Mutates state directly
      return state;
    case 'UPDATE_ITEM':
      const item = state.items.find(i => i.id === action.payload.id);
      item.name = action.payload.name; // Mutates nested object
      return state;
    default:
      return state;
  }
};

// ✅ Solution: Immutable state updates
const reducer = (state, action) => {
  switch (action.type) {
    case 'ADD_ITEM':
      return {
        ...state,
        items: [...state.items, action.payload]
      };
    case 'UPDATE_ITEM':
      return {
        ...state,
        items: state.items.map(item =>
          item.id === action.payload.id
            ? { ...item, ...action.payload }
            : item
        )
      };
    default:
      return state;
  }
};
```

**Prevention**:
- Always return new state objects from reducers
- Use spread operator or immutability libraries
- Enable strict mode in React to catch mutations
- Use TypeScript with readonly types for state

### Issue 5: Memory Leaks with useEffect

**Symptoms**:
- Memory usage increases over time
- Event listeners accumulate
- Timers continue running after component unmount
- Network requests continue after navigation

**Diagnosis**:
- Check if useEffect cleanup functions are properly implemented
- Look for event listeners that aren't removed
- Verify that async operations are cancelled

**Solution**:
```javascript
// ❌ Problem: No cleanup
useEffect(() => {
  const handleResize = () => setWindowSize(window.innerWidth);
  window.addEventListener('resize', handleResize);
  
  const timer = setInterval(() => {
    fetchUpdates();
  }, 5000);
}, []);

// ✅ Solution: Proper cleanup
useEffect(() => {
  const handleResize = () => setWindowSize(window.innerWidth);
  window.addEventListener('resize', handleResize);
  
  const timer = setInterval(() => {
    fetchUpdates();
  }, 5000);
  
  return () => {
    window.removeEventListener('resize', handleResize);
    clearInterval(timer);
  };
}, []);

// ✅ Solution: Cancel async operations
useEffect(() => {
  let cancelled = false;
  
  const fetchData = async () => {
    const result = await api.getData();
    if (\!cancelled) {
      setData(result);
    }
  };
  
  fetchData();
  
  return () => {
    cancelled = true;
  };
}, []);
```

**Prevention**:
- Always implement cleanup functions for side effects
- Use AbortController for cancelling fetch requests
- Remove event listeners in cleanup functions
- Clear timers and intervals

## Advanced Troubleshooting

### Performance Issues

**Identifying Performance Bottlenecks**:
- Use React Developer Tools Profiler
- Enable "Record why each component rendered" in DevTools
- Measure render times with performance.mark()
- Profile in production builds for accurate measurements

**Common Performance Problems**:
```javascript
// Problem: Expensive calculation on every render
const ExpensiveComponent = ({ items }) => {
  const sortedItems = items.sort((a, b) => a.name.localeCompare(b.name));
  // This sorts on every render\!
  
  return <div>{/* render sortedItems */}</div>;
};

// Solution: Use useMemo
const ExpensiveComponent = ({ items }) => {
  const sortedItems = useMemo(() => 
    items.sort((a, b) => a.name.localeCompare(b.name)),
    [items]
  );
  
  return <div>{/* render sortedItems */}</div>;
};
```

### Integration Problems

**Third-Party Library Conflicts**:
- Ensure hooks are called in same order across renders
- Check for library-specific hook requirements
- Verify compatibility with React version

**State Management Library Integration**:
```javascript
// Problem: Mixing useState with Redux incorrectly
const Component = () => {
  const reduxState = useSelector(state => state.user);
  const [localState, setLocalState] = useState(reduxState.name);
  // Local state becomes out of sync with Redux
};

// Solution: Derive state or use proper synchronization
const Component = () => {
  const reduxState = useSelector(state => state.user);
  const [localState, setLocalState] = useState('');
  
  useEffect(() => {
    setLocalState(reduxState.name);
  }, [reduxState.name]);
};
```

### Edge Cases

**Conditional Hook Calls**:
```javascript
// ❌ Problem: Hooks called conditionally
const Component = ({ shouldFetch }) => {
  if (shouldFetch) {
    const data = useFetch('/api/data'); // Violates rules of hooks
  }
};

// ✅ Solution: Always call hooks, handle condition inside
const Component = ({ shouldFetch }) => {
  const data = useFetch(shouldFetch ? '/api/data' : null);
};
```

**Dynamic Hook Dependencies**:
```javascript
// ❌ Problem: Dynamic dependencies
const Component = ({ fields }) => {
  useEffect(() => {
    // Effect logic
  }, fields); // Array changes reference every render
};

// ✅ Solution: Stabilize dependencies
const Component = ({ fields }) => {
  const stableFields = useMemo(() => fields, [JSON.stringify(fields)]);
  
  useEffect(() => {
    // Effect logic
  }, [stableFields]);
};
```

## Diagnostic Tools

### React Developer Tools
- **Components Tab**: Inspect hook state and values
- **Profiler Tab**: Analyze component render performance
- **Settings**: Enable "Record why components rendered"

### Browser DevTools
- **Performance Tab**: Profile JavaScript execution
- **Memory Tab**: Detect memory leaks
- **Console**: Log hook values during development

### ESLint Rules
```json
{
  "extends": ["plugin:react-hooks/recommended"],
  "rules": {
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn"
  }
}
```

### Custom Debugging Hooks
```javascript
const useDebugValue = (value, label = 'Value') => {
  useEffect(() => {
    console.log(`${label}:`, value);
  }, [value, label]);
};

const useWhyDidYouUpdate = (name, props) => {
  const previous = useRef();
  
  useEffect(() => {
    if (previous.current) {
      const allKeys = Object.keys({ ...previous.current, ...props });
      const changedProps = {};
      
      allKeys.forEach(key => {
        if (previous.current[key] \!== props[key]) {
          changedProps[key] = {
            from: previous.current[key],
            to: props[key]
          };
        }
      });
      
      if (Object.keys(changedProps).length) {
        console.log('[why-did-you-update]', name, changedProps);
      }
    }
    
    previous.current = props;
  });
};
```

## When to Escalate

**Signs That Expert Help is Needed**:

1. **Performance Issues Persist**: After applying optimization techniques, performance problems continue
2. **Complex State Synchronization**: Multiple state sources need coordination beyond basic patterns
3. **Memory Leaks Continue**: Despite proper cleanup, memory usage keeps growing
4. **Architecture Decisions**: Choosing between hooks vs. external state management requires domain expertise
5. **Team Standards**: Establishing consistent patterns across large development teams

**Before Escalating**:
- Profile the application to identify actual bottlenecks
- Try isolated reproduction of the issue
- Review official React documentation and guidelines
- Check community solutions and Stack Overflow discussions

**Information to Provide**:
- Specific error messages and stack traces
- Minimal reproduction case
- Performance profiling results
- Current hook implementation code
- Expected vs. actual behavior description
EOF < /dev/null