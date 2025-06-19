# Task Manager SPA

A simple Single Page Application (SPA) built with Deno.js for managing personal task lists.

## Overview

This project is a lightweight task management application that allows users to create, organize, and track their daily tasks. The application focuses on simplicity and efficiency, providing essential task management features without unnecessary complexity.

## Features

### Core Functionality
- **Task Creation**: Add new tasks with titles and descriptions
- **Task Organization**: Categorize tasks by priority (High, Medium, Low)
- **Task Status**: Mark tasks as pending, in progress, or completed
- **Task Editing**: Modify existing task details and status
- **Task Deletion**: Remove tasks that are no longer needed

### User Experience
- **Clean Interface**: Minimalist design focused on productivity
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Real-time Updates**: Immediate feedback for all user actions
- **Keyboard Shortcuts**: Quick task creation and navigation
- **Dark/Light Mode**: Theme switching for user preference

### Data Management
- **Local Storage**: Tasks persist between browser sessions
- **Export/Import**: Backup and restore task data as JSON
- **Search/Filter**: Find tasks by title, status, or priority
- **Task Statistics**: View productivity metrics and completion rates

## Technical Approach

### Frontend Architecture
- **Framework**: Vanilla JavaScript with modern ES modules
- **Styling**: CSS Grid/Flexbox for layout, CSS Custom Properties for theming
- **State Management**: Simple reactive state pattern
- **Component System**: Lightweight custom components

### Backend Services
- **Runtime**: Deno.js for server-side functionality
- **API Design**: RESTful endpoints for task operations
- **Data Storage**: JSON file-based storage with optional SQLite upgrade path
- **Static Serving**: Serve SPA assets and handle routing

### Development Tools
- **Build System**: Deno's native bundling and optimization
- **Testing**: Deno's built-in test runner
- **Linting**: Deno's integrated linter and formatter
- **Hot Reload**: Development server with automatic refresh

## Project Structure

```
task-manager-spa/
├── src/
│   ├── frontend/
│   │   ├── components/
│   │   ├── styles/
│   │   ├── utils/
│   │   └── main.js
│   ├── backend/
│   │   ├── api/
│   │   ├── models/
│   │   └── server.ts
│   └── shared/
│       └── types.ts
├── static/
│   ├── index.html
│   └── assets/
├── tests/
├── docs/
└── scripts/
```

## Target Users

- **Individual Professionals**: Personal task and project management
- **Students**: Assignment and study schedule tracking
- **Small Teams**: Shared task visibility and coordination
- **Productivity Enthusiasts**: Clean, distraction-free task management

## Success Criteria

- **Performance**: Page load under 2 seconds, smooth interactions
- **Usability**: Intuitive interface requiring no training
- **Reliability**: Zero data loss, consistent state management
- **Accessibility**: WCAG 2.1 compliance for inclusive design
- **Mobile Experience**: Full functionality on mobile devices

## Future Enhancements

- **Collaboration**: Share task lists with team members
- **Integration**: Connect with calendar and email applications
- **Advanced Features**: Recurring tasks, subtasks, time tracking
- **Offline Support**: Progressive Web App capabilities
- **Sync**: Cloud storage integration for multi-device access

## Development Timeline

- **Phase 1**: Core task CRUD operations and basic UI
- **Phase 2**: Enhanced UX, filtering, and local storage
- **Phase 3**: Advanced features, PWA capabilities, and polish