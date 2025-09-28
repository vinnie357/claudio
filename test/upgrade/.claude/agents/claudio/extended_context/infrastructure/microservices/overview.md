# Microservices Infrastructure Context for TaskFlow

## Project-Specific Guidance
Based on discovery analysis, TaskFlow has evolved to a microservices architecture with decomposed services for task management, synchronization, and AI processing using Node.js and Express.

## Recommended Approaches
- **Service Decomposition**: Organize services by domain boundaries (task management, user management, synchronization, AI analytics)
- **Event-Driven Architecture**: Implement WebSocket-based event streaming for real-time task synchronization across services
- **API Gateway Patterns**: Use centralized API gateway for mobile and web client routing to appropriate microservices
- **Database Per Service**: Maintain data isolation with PostgreSQL for transactional data and MongoDB for document storage

## Integration Patterns
Microservices architecture integrates with:
- React Native mobile apps through REST APIs and WebSocket connections
- Real-time synchronization service for cross-device task updates
- AI processing service for task estimation and productivity analytics
- Authentication service for user management across all TaskFlow applications
- Notification service for task reminders and collaborative updates

## Quality Standards
- Service independence with minimal coupling between task management domains
- API versioning strategies for backward compatibility with mobile clients
- Circuit breaker patterns for resilient service communication
- Comprehensive service-level monitoring and health checks
- Database transaction patterns that maintain consistency across service boundaries

## Next Steps
- Implement service mesh for improved service-to-service communication
- Set up distributed tracing for request flow analysis across TaskFlow services
- Establish service-specific deployment pipelines with independent scaling
- Configure centralized logging and monitoring for microservices observability