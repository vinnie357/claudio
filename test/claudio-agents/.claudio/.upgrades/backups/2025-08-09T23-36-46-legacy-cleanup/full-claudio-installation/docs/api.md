# Task Management API Documentation

## Overview

The Task Management API is a Phoenix-based REST API that provides task management functionality with real-time WebSocket connections through Phoenix LiveView.

- **Base URL**: `http://localhost:4000/api`
- **Version**: v1.0
- **Authentication**: None (Development API)
- **Content Type**: `application/json`
- **Phoenix Framework**: v1.7.21
- **Elixir**: v1.18.4

## API Architecture

The API is built using:
- **Phoenix Framework** for HTTP routing and middleware
- **Bandit HTTP Server** for high-performance request handling
- **GenServer** for in-memory task storage and state management
- **Phoenix LiveView** for real-time WebSocket connections
- **JSON** serialization using Jason library

## Task Data Model

### Task Object

```json
{
  "id": "string (8-character base64 ID)",
  "title": "string (1-100 characters)",
  "completed": "boolean",
  "created_at": "datetime (ISO8601 UTC)"
}
```

#### Field Specifications

- **id**: Auto-generated 8-character base64-encoded identifier
- **title**: Task description (1-100 characters, alphanumeric + common punctuation)
- **completed**: Boolean completion status (default: false)
- **created_at**: UTC timestamp in ISO8601 format

#### Validation Rules

- Title must be 1-100 characters
- Title supports: `a-zA-Z0-9\s\-_.,\!?()\[\]:\/`
- Title cannot be empty after trimming whitespace
- ID is automatically generated using cryptographically secure random bytes

## REST API Endpoints

### Tasks Collection

#### GET /api/tasks
**Description**: Retrieve all tasks sorted by creation date (newest first)

**Request**:
```bash
curl -X GET "http://localhost:4000/api/tasks" \
     -H "Accept: application/json"
```

**Response** (200 OK):
```json
{
  "tasks": [
    {
      "id": "AbCdEfGh",
      "title": "Complete project documentation",
      "completed": false,
      "created_at": "2024-08-10T22:30:15.123456Z"
    },
    {
      "id": "XyZ12345",
      "title": "Review API endpoints",
      "completed": true,
      "created_at": "2024-08-10T21:15:30.654321Z"
    }
  ]
}
```

#### POST /api/tasks
**Description**: Create a new task

**Request Body**:
```json
{
  "task": {
    "title": "string (required)"
  }
}
```

**Request Example**:
```bash
curl -X POST "http://localhost:4000/api/tasks" \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -d '{
       "task": {
         "title": "Implement user authentication"
       }
     }'
```

**Response** (201 Created):
```json
{
  "task": {
    "id": "NewTask1",
    "title": "Implement user authentication",
    "completed": false,
    "created_at": "2024-08-10T22:35:42.789012Z"
  }
}
```

**Validation Error** (400 Bad Request):
```json
{
  "error": "Task title cannot be empty"
}
```

### Individual Task Operations

#### GET /api/tasks/:id
**Description**: Retrieve a specific task by ID

**Parameters**:
- `id` (path, required): Task ID

**Request Example**:
```bash
curl -X GET "http://localhost:4000/api/tasks/AbCdEfGh" \
     -H "Accept: application/json"
```

**Response** (200 OK):
```json
{
  "task": {
    "id": "AbCdEfGh",
    "title": "Complete project documentation",
    "completed": false,
    "created_at": "2024-08-10T22:30:15.123456Z"
  }
}
```

**Not Found** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

#### PUT /api/tasks/:id/complete
**Description**: Mark a task as completed

**Parameters**:
- `id` (path, required): Task ID

**Request Example**:
```bash
curl -X PUT "http://localhost:4000/api/tasks/AbCdEfGh/complete" \
     -H "Accept: application/json"
```

**Response** (200 OK):
```json
{
  "task": {
    "id": "AbCdEfGh",
    "title": "Complete project documentation",
    "completed": true,
    "created_at": "2024-08-10T22:30:15.123456Z"
  }
}
```

**Not Found** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

#### DELETE /api/tasks/:id
**Description**: Delete a task

**Parameters**:
- `id` (path, required): Task ID

**Request Example**:
```bash
curl -X DELETE "http://localhost:4000/api/tasks/AbCdEfGh" \
     -H "Accept: application/json"
```

**Response** (204 No Content):
```
(empty response body)
```

**Not Found** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

### Statistics Endpoint

#### GET /api/stats
**Description**: Get task completion statistics

**Request Example**:
```bash
curl -X GET "http://localhost:4000/api/stats" \
     -H "Accept: application/json"
```

**Response** (200 OK):
```json
{
  "stats": {
    "total": 15,
    "completed": 8,
    "pending": 7
  }
}
```

#### Statistics Object Fields

- **total**: Total number of tasks in the system
- **completed**: Number of tasks marked as completed
- **pending**: Number of incomplete tasks (total - completed)

## WebSocket / Real-Time Integration

### Phoenix LiveView Connection

The API integrates with Phoenix LiveView for real-time updates:

**WebSocket Endpoint**: `ws://localhost:4000/live`

**Connection Details**:
- Protocol: WebSocket with Phoenix LiveView protocol
- Authentication: Session-based (cookie: `_task_app_key`)
- Signing Salt: `task_app_lv`

### Real-Time Events

LiveView automatically synchronizes the following events:

1. **Task Creation**: New tasks appear instantly in connected clients
2. **Task Completion**: Status changes propagate immediately
3. **Task Deletion**: Removed tasks disappear from all clients
4. **Statistics Updates**: Real-time counter updates

### Client-Side Integration

```javascript
// Phoenix LiveView handles WebSocket connections automatically
// No manual WebSocket code needed for basic functionality

// For custom integration:
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

liveSocket.connect()
```

## HTTP Status Codes

| Status Code | Description | Usage |
|------------|-------------|-------|
| 200 | OK | Successful GET, PUT operations |
| 201 | Created | Successful POST (task creation) |
| 204 | No Content | Successful DELETE operations |
| 400 | Bad Request | Validation errors, malformed requests |
| 404 | Not Found | Task ID not found |
| 500 | Internal Server Error | Server-side errors |

## Error Handling

### Error Response Format

All errors return a consistent JSON structure:

```json
{
  "error": "Human-readable error message"
}
```

### Common Error Messages

| Error | Cause | Solution |
|-------|-------|----------|
| "Task title is required" | Missing title field | Provide non-empty title |
| "Task title cannot be empty" | Empty or whitespace-only title | Use meaningful task description |
| "Task title cannot exceed 100 characters" | Title too long | Shorten task description |
| "Task title contains invalid characters" | Unsupported characters | Use alphanumeric and basic punctuation |
| "Task not found" | Invalid or non-existent task ID | Verify task ID exists |

### Validation Details

The API uses the `TaskApp.Task` module for validation:

```elixir
# Supported title pattern
~r/^[a-zA-Z0-9\s\-_.,\!?()\[\]:\/]+$/

# Length constraints
@min_title_length 1
@max_title_length 100
```

## Data Persistence

**Important**: This is a development API using in-memory storage via GenServer. Data is not persisted across server restarts.

**Storage Characteristics**:
- In-memory HashMap using Elixir's GenServer
- Process-based state management
- No database persistence
- Data resets on application restart
- Concurrent access handled by GenServer message passing

## Rate Limiting

Currently no rate limiting is implemented in this development API.

## Authentication

No authentication is required for this development API. All endpoints are publicly accessible.

## CORS

Cross-Origin Resource Sharing (CORS) is configured for development:
- `check_origin: false` allows all origins
- Suitable for development only

## Example API Workflows

### Complete Task Management Flow

```bash
# 1. Create a new task
curl -X POST http://localhost:4000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"task": {"title": "Write API documentation"}}'

# Response: {"task": {"id": "abc12345", "title": "Write API documentation", "completed": false, ...}}

# 2. List all tasks
curl http://localhost:4000/api/tasks

# 3. Get specific task
curl http://localhost:4000/api/tasks/abc12345

# 4. Mark task as complete
curl -X PUT http://localhost:4000/api/tasks/abc12345/complete

# 5. Check statistics
curl http://localhost:4000/api/stats

# 6. Delete task
curl -X DELETE http://localhost:4000/api/tasks/abc12345
```

### Error Handling Example

```bash
# Attempt to create task with empty title
curl -X POST http://localhost:4000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"task": {"title": ""}}'

# Response: 400 Bad Request
# {"error": "Task title cannot be empty"}

# Attempt to access non-existent task
curl http://localhost:4000/api/tasks/nonexistent

# Response: 404 Not Found
# {"error": "Task not found"}
```

## Development Setup

### Prerequisites

- Elixir 1.18.4+
- Phoenix 1.7.21+
- Mix build tool

### Starting the Server

```bash
# Install dependencies
mix deps.get

# Start Phoenix server
mix phx.server

# Server starts at http://localhost:4000
```

### Testing the API

```bash
# Test server health
curl http://localhost:4000/api/stats

# If you get "no process" error, the TaskStore GenServer needs initialization
# This is a known issue in the current development setup
```

## API Client Libraries

### cURL Examples

All examples in this documentation use cURL for simplicity and compatibility.

### JavaScript/Node.js

```javascript
// Using fetch API
async function getTasks() {
  const response = await fetch('http://localhost:4000/api/tasks');
  const data = await response.json();
  return data.tasks;
}

async function createTask(title) {
  const response = await fetch('http://localhost:4000/api/tasks', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ task: { title } })
  });
  const data = await response.json();
  return data.task;
}
```

### Python

```python
import requests

# Get all tasks
response = requests.get('http://localhost:4000/api/tasks')
tasks = response.json()['tasks']

# Create new task
task_data = {'task': {'title': 'New task from Python'}}
response = requests.post('http://localhost:4000/api/tasks', json=task_data)
new_task = response.json()['task']
```

### Elixir (HTTPoison)

```elixir
# Get tasks
{:ok, response} = HTTPoison.get("http://localhost:4000/api/tasks")
{:ok, %{"tasks" => tasks}} = Jason.decode(response.body)

# Create task
task_payload = %{task: %{title: "New task from Elixir"}}
{:ok, response} = HTTPoison.post(
  "http://localhost:4000/api/tasks",
  Jason.encode\!(task_payload),
  [{"Content-Type", "application/json"}]
)
```

## Architecture Notes

### Phoenix Framework Benefits

- **Fault Tolerance**: Supervisor trees ensure system resilience
- **Concurrent Processing**: Lightweight Elixir processes handle multiple requests
- **Real-Time Capabilities**: Built-in WebSocket support via Phoenix Channels/LiveView
- **Hot Code Reloading**: Development-friendly code updates without restarts

### GenServer State Management

The TaskStore uses GenServer for thread-safe state management:

```elixir
# All operations are serialized through GenServer message passing
GenServer.call(TaskApp.TaskStore, :get_all_tasks)
GenServer.call(TaskApp.TaskStore, {:add_task, task})
```

This ensures data consistency in concurrent access scenarios.

### Performance Considerations

- **In-Memory Storage**: Fast read/write operations
- **No Database Overhead**: Eliminates I/O bottlenecks for development
- **Process Isolation**: GenServer crashes don't affect HTTP handling
- **Lightweight JSON**: Minimal serialization overhead

---

This API documentation covers all available endpoints, data models, error handling, and integration patterns for the Phoenix Task Management API. The API provides a solid foundation for task management applications with real-time capabilities through Phoenix LiveView.
EOF < /dev/null