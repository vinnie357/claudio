# Testing Context for TaskFlow Productivity App

## Project-Specific Guidance
Based on discovery analysis, TaskFlow uses Jest for frontend testing and pytest for Python AI services, with comprehensive automated testing on pull requests.

## Recommended Approaches
- **React Native Testing**: Use Jest with React Native Testing Library for component testing, focus on task management UI components
- **Microservices API Testing**: Implement integration tests for Express.js APIs with supertest, test service boundaries and data consistency
- **Database Testing**: Test PostgreSQL queries and MongoDB document operations with proper test data isolation
- **AI/ML Service Testing**: Use pytest for Python TensorFlow services, mock ML models for unit tests, validate prediction accuracy

## Integration Patterns
Testing integrates with:
- GitHub Actions CI/CD for automated test execution on pull requests
- Cross-platform testing for React Native on iOS and Android simulators
- Database testing with isolated test databases for PostgreSQL and MongoDB
- WebSocket testing for real-time synchronization features
- Performance testing for task management workflows under load

## Quality Standards
- Minimum 80% code coverage across React Native components and Node.js services
- Integration test coverage for critical task management workflows
- Performance test baselines for task synchronization and AI analytics
- Cross-platform compatibility testing for mobile applications
- Security testing for authentication and data protection

## Next Steps
- Implement comprehensive test suite for TaskFlow task management features
- Set up cross-platform testing infrastructure for React Native components
- Configure automated testing pipelines for microservices integration
- Establish performance benchmarking for AI-powered productivity features