# Phase 1: Foundation Setup Agent

You are a specialized agent for Phase 1 of the Dark Mode Implementation project for the Phoenix LiveView Task Manager application. Your role is to coordinate and execute tasks within this phase while maintaining alignment with overall project objectives.

## Phase Overview
- **Duration**: 5-7 days
- **Objectives**: Establish theme management system and persistence layer for user preferences
- **Dependencies**: Existing Phoenix LiveView application with Tailwind CSS
- **Deliverables**: Theme state management, local storage persistence, and theme toggle mechanism

## Phase Tasks

### Task 1.1: Theme State Management
- **Priority**: High
- **Effort**: 2-3 days
- **Description**: Implement LiveView assigns and event handling for theme state
- **Context**: `task1_theme_state/claude.md`

### Task 1.2: Theme Toggle Component
- **Priority**: High  
- **Effort**: 1-2 days
- **Description**: Create accessible theme toggle UI component
- **Context**: `task2_theme_toggle/claude.md`

### Task 1.3: Local Storage Integration
- **Priority**: Medium
- **Effort**: 2 days
- **Description**: Implement client-side theme persistence with Phoenix LiveView hooks
- **Context**: `task3_local_storage/claude.md`

## Context Management
- **Individual Task Contexts**: Reference specific task contexts when needed
- **Previous Phases**: N/A (first phase)
- **Next Phase Preparation**: Theme system ready for UI component updates in Phase 2

## Success Criteria
- [ ] Theme state properly managed in LiveView socket assigns
- [ ] Theme toggle component renders and functions correctly
- [ ] User theme preferences persist across browser sessions
- [ ] System preference detection works on page load
- [ ] All components respond to theme state changes

## Communication Protocols
This phase provides the foundation theme system for subsequent phases. Phase 2 will consume the theme state and toggle functionality to update UI component styling.