# Node.js Development Context for TaskFlow

## Project-Specific Guidance
Based on discovery analysis, TaskFlow uses Node.js with Express framework for REST APIs in a microservices architecture, with npm package management and comprehensive CI/CD automation.

## Recommended Approaches
- **Express.js API Design**: Structure RESTful APIs for task management, user authentication, and synchronization services
- **Microservices Patterns**: Implement service-specific Express applications with proper separation of concerns
- **Async/Await Patterns**: Use modern JavaScript async patterns for database operations and service communication
- **TypeScript Integration**: Leverage TypeScript for type safety across Node.js microservices

## Integration Patterns
Node.js development integrates with:
- PostgreSQL database connections for task and user data persistence
- MongoDB integration for document storage and analytics data
- WebSocket server implementation for real-time task synchronization
- Python AI services communication through REST APIs or message queues
- React Native mobile clients through RESTful API endpoints

## Quality Standards
- ESLint and Prettier configurations for consistent Node.js code formatting
- Jest testing framework for unit and integration testing of Express APIs
- TypeScript strict mode for enhanced type safety across services
- Comprehensive error handling and logging for production monitoring
- Security best practices for API authentication and data validation

## Next Steps
- Implement Express.js middleware patterns for TaskFlow-specific functionality
- Set up Node.js development environment with hot reloading and debugging
- Configure TypeScript build processes for microservices development
- Establish Node.js performance monitoring and profiling for TaskFlow APIs