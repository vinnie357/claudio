# React Native Development Context for TaskFlow

## Project-Specific Guidance
Based on discovery analysis, this TaskFlow project uses React Native with TypeScript for cross-platform mobile development, focusing on productivity features with offline capabilities.

## Recommended Approaches
- **Cross-Platform Components**: Create shared components with platform-specific adaptations for iOS and Android task management interfaces
- **Offline-First Architecture**: Implement local storage patterns with intelligent sync reconciliation for task data
- **State Management**: Use appropriate state management (Redux, Context, or Zustand) for complex task synchronization states
- **Performance Optimization**: Apply React Native performance best practices for smooth task list rendering and navigation

## Integration Patterns
React Native development should integrate with:
- WebSocket connections for real-time task synchronization across devices
- RESTful APIs for task CRUD operations with offline queuing
- Platform-specific native modules for device-specific productivity features
- Push notifications for task reminders and collaborative updates
- Local database (SQLite/Realm) for offline task storage

## Quality Standards
- TypeScript strict mode for type safety across cross-platform components
- Platform-specific testing on both iOS and Android simulators/devices
- Performance profiling for task list rendering and synchronization
- Accessibility compliance for productivity app interfaces
- Memory usage optimization for long-running task management sessions

## Next Steps
- Implement React Native component library for consistent TaskFlow UI
- Set up cross-platform testing infrastructure for task management features
- Configure offline storage and synchronization patterns for task data
- Establish performance monitoring for mobile task management workflows