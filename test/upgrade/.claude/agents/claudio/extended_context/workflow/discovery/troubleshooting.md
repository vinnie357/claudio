# Discovery Troubleshooting for TaskFlow Productivity App

## Common Issues

### React Native Project Structure Analysis
**Problem**: Complex cross-platform structure difficult to analyze
**Solution**: Focus on platform-specific directories (ios/, android/) and shared components, examine metro.config.js and package.json dependencies

### Microservices Architecture Detection
**Problem**: Service boundaries not clearly defined in codebase
**Solution**: Analyze package.json files in subdirectories, examine API routes, look for Docker configurations and service-specific documentation

### AI/ML Integration Discovery
**Problem**: Python ML services integration points unclear
**Solution**: Look for Python requirements.txt files, examine API endpoints calling ML services, check for TensorFlow model files and training scripts

### Database Integration Patterns
**Problem**: Multiple database types (PostgreSQL, MongoDB) create complexity
**Solution**: Examine connection configurations, look for ORM/ODM patterns, analyze data migration scripts and schema definitions

## Debug Strategies
- Use file system analysis to identify React Native project structure patterns
- Search for microservice indicators like separate package.json files and Docker configurations  
- Examine API documentation and endpoint definitions to understand service boundaries
- Analyze database connection strings and model definitions to map data architecture
- Look for CI/CD configuration files to understand deployment patterns

## Getting Help
- React Native documentation for cross-platform development patterns
- Express.js and Node.js microservices architecture guides
- PostgreSQL and MongoDB integration documentation
- TensorFlow serving and model deployment resources
- GitHub Actions documentation for mobile CI/CD workflows