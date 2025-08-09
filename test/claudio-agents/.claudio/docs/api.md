# Task App API Reference Documentation

## Overview

The Task App provides a RESTful API for managing tasks built with Phoenix LiveView. The API follows standard HTTP conventions and returns JSON responses.

- **Base URL**: `http://localhost:4000/api`
- **Content Type**: `application/json`
- **Phoenix Version**: 1.7.10
- **Phoenix LiveView**: 0.20.2

## Authentication

**Current Status**: No authentication required (development phase)

**Future Implementation**: The API is designed to support Bearer Token authentication:
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     http://localhost:4000/api/endpoint
```

## Endpoints Reference

### Task Management Endpoints

#### GET /api/tasks
**Description**: Retrieve list of all tasks, sorted by creation date (newest first)

**Parameters**: None

**Request Example**:
```bash
curl -X GET "http://localhost:4000/api/tasks" \
     -H "Content-Type: application/json"
```

**Response Example** (200 OK):
```json
{
  "tasks": [
    {
      "id": "AbC1De2f",
      "title": "Buy groceries",
      "completed": false,
      "created_at": "2025-08-09T14:30:00Z"
    },
    {
      "id": "XyZ3Uv4w",
      "title": "Finish project documentation",
      "completed": true,
      "created_at": "2025-08-09T13:15:00Z"
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

**Validation Rules**:
- `title`: Required, 1-100 characters, alphanumeric with common punctuation
- Title is automatically trimmed of whitespace

**Request Example**:
```bash
curl -X POST "http://localhost:4000/api/tasks" \
     -H "Content-Type: application/json" \
     -d '{
       "task": {
         "title": "Learn Phoenix LiveView"
       }
     }'
```

**Response Example** (201 Created):
```json
{
  "task": {
    "id": "QwE5Rt6y",
    "title": "Learn Phoenix LiveView",
    "completed": false,
    "created_at": "2025-08-09T15:45:00Z"
  }
}
```

**Error Response** (400 Bad Request):
```json
{
  "error": "Task title cannot be empty"
}
```

#### GET /api/tasks/:id
**Description**: Retrieve a specific task by ID

**Parameters**:
- `id` (path, required): Task ID

**Request Example**:
```bash
curl -X GET "http://localhost:4000/api/tasks/AbC1De2f" \
     -H "Content-Type: application/json"
```

**Response Example** (200 OK):
```json
{
  "task": {
    "id": "AbC1De2f",
    "title": "Buy groceries",
    "completed": false,
    "created_at": "2025-08-09T14:30:00Z"
  }
}
```

**Error Response** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

#### PUT /api/tasks/:id/complete
**Description**: Mark a specific task as completed

**Parameters**:
- `id` (path, required): Task ID

**Request Body**: None

**Request Example**:
```bash
curl -X PUT "http://localhost:4000/api/tasks/AbC1De2f/complete" \
     -H "Content-Type: application/json"
```

**Response Example** (200 OK):
```json
{
  "task": {
    "id": "AbC1De2f",
    "title": "Buy groceries",
    "completed": true,
    "created_at": "2025-08-09T14:30:00Z"
  }
}
```

**Error Response** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

#### DELETE /api/tasks/:id
**Description**: Delete a specific task

**Parameters**:
- `id` (path, required): Task ID

**Request Example**:
```bash
curl -X DELETE "http://localhost:4000/api/tasks/AbC1De2f" \
     -H "Content-Type: application/json"
```

**Response Example** (204 No Content):
```
(Empty response body)
```

**Error Response** (404 Not Found):
```json
{
  "error": "Task not found"
}
```

### Statistics Endpoint

#### GET /api/stats
**Description**: Retrieve task statistics

**Parameters**: None

**Request Example**:
```bash
curl -X GET "http://localhost:4000/api/stats" \
     -H "Content-Type: application/json"
```

**Response Example** (200 OK):
```json
{
  "stats": {
    "total": 10,
    "completed": 6,
    "pending": 4
  }
}
```

## Data Models

### Task Object
```json
{
  "id": "string",           // 8-character Base64 encoded ID
  "title": "string",        // Task title (1-100 characters)
  "completed": "boolean",   // Completion status
  "created_at": "datetime"  // ISO 8601 UTC timestamp
}
```

### Stats Object
```json
{
  "total": "integer",       // Total number of tasks
  "completed": "integer",   // Number of completed tasks
  "pending": "integer"      // Number of pending tasks (total - completed)
}
```

## Error Handling

### Error Response Format
All errors follow a consistent JSON structure:
```json
{
  "error": "Human readable error message"
}
```

### HTTP Status Codes
- `200`: Success
- `201`: Created (for POST requests)
- `204`: No Content (for DELETE requests)
- `400`: Bad Request (validation errors)
- `404`: Not Found
- `500`: Internal Server Error

### Common Error Messages

#### Validation Errors (400 Bad Request)
- `"Task title is required"`
- `"Task title must be text"`
- `"Task title cannot be empty"`
- `"Task title must be at least 1 character"`
- `"Task title cannot exceed 100 characters"`
- `"Task title contains invalid characters"`

#### Resource Errors (404 Not Found)
- `"Task not found"`

## Phoenix-Specific Implementation Details

### Architecture
- **Framework**: Phoenix 1.7.10 with LiveView 0.20.2
- **State Management**: GenServer-based TaskStore for in-memory storage
- **Data Persistence**: In-memory (data resets on application restart)
- **Concurrency**: Elixir/OTP GenServer provides thread-safe operations
- **ID Generation**: Cryptographically secure 8-character Base64 IDs

### Pipeline Configuration
```elixir
pipeline :api do
  plug :accepts, ["json"]
end
```

### Controller Pattern
The API follows Phoenix controller conventions:
- Controllers use `TaskAppWeb.TaskController`
- JSON responses via `json(conn, data)`
- HTTP status codes via `put_status(conn, status)`

### Validation
- Input validation handled by `TaskApp.Task.validate_title/1`
- Pattern matching for request structure validation
- Comprehensive error handling with descriptive messages

## Integration Examples

### JavaScript/Node.js
```javascript
// Fetch all tasks
const response = await fetch('http://localhost:4000/api/tasks');
const data = await response.json();
console.log(data.tasks);

// Create a new task
const newTask = await fetch('http://localhost:4000/api/tasks', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    task: { title: 'New task' }
  }),
});
const taskData = await newTask.json();
console.log(taskData.task);
```

### Python
```python
import requests
import json

# Get all tasks
response = requests.get('http://localhost:4000/api/tasks')
tasks = response.json()['tasks']

# Create a new task
new_task_data = {
    'task': {
        'title': 'Learn Elixir'
    }
}
response = requests.post(
    'http://localhost:4000/api/tasks',
    headers={'Content-Type': 'application/json'},
    data=json.dumps(new_task_data)
)
task = response.json()['task']
```

### Ruby
```ruby
require 'net/http'
require 'json'

# Get all tasks
uri = URI('http://localhost:4000/api/tasks')
response = Net::HTTP.get_response(uri)
tasks = JSON.parse(response.body)['tasks']

# Create a new task
uri = URI('http://localhost:4000/api/tasks')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri)
request['Content-Type'] = 'application/json'
request.body = JSON.dump({
  task: { title: 'Ruby task' }
})
response = http.request(request)
task = JSON.parse(response.body)['task']
```

## Development Server

### Starting the Application
```bash
mix deps.get
mix phx.server
```

The API will be available at `http://localhost:4000/api`

### Development Tools
- **Live Reload**: Enabled for development
- **Phoenix LiveDashboard**: Available at `http://localhost:4000/dev/dashboard`
- **Code Reloading**: Automatic on file changes

## Future Enhancements

### Planned Features
1. **Authentication**: Bearer token or API key authentication
2. **Pagination**: Support for `limit` and `offset` parameters on task listing
3. **Filtering**: Filter tasks by completion status
4. **Sorting**: Custom sort orders beyond creation date
5. **Task Updates**: PUT endpoint for updating task titles
6. **Bulk Operations**: Batch create/update/delete operations

### Security Considerations
- Add rate limiting for API endpoints
- Implement CORS policies for cross-origin requests
- Add input sanitization for enhanced security
- Implement request/response logging for audit trails

## Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Kill process using port 4000
lsof -ti:4000 | xargs kill -9
```

#### Mix Dependencies
```bash
# Clean and reinstall dependencies
mix deps.clean --all
mix deps.get
```

#### Database/State Issues
Since the app uses in-memory storage, restart the server to reset all data:
```bash
# Stop server (Ctrl+C) and restart
mix phx.server
```

### API Testing
Use tools like curl, Postman, or HTTPie to test endpoints:
```bash
# Test with HTTPie
http GET localhost:4000/api/tasks
http POST localhost:4000/api/tasks task:='{"title":"Test task"}'
```
EOF < /dev/null