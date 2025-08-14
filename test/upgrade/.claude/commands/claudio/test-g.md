---
description: "Generate and update TaskFlow project-specific test commands and configurations"
argument-hint: "[platform] [--update]"
allowed-tools: Write, Read, Bash
system: claudio-system
---

Generate and update TaskFlow project-specific test commands, configurations, and testing infrastructure with intelligent platform detection and technology stack integration.

## TaskFlow Test Generation Overview

**Intelligent TaskFlow Test Command Generation:**
1. **Analyze project structure** to detect testing requirements across platforms
2. **Generate platform-specific test configurations** for React Native, Node.js, Python
3. **Create cross-platform testing workflows** with synchronization validation
4. **Update existing test commands** with TaskFlow-specific optimizations
5. **Integrate with CI/CD pipelines** for automated testing workflows

## Command Behavior

**TaskFlow Test Generation Strategy:**
- **Comprehensive Analysis**: Scan TaskFlow codebase for testing framework integration opportunities
- **Platform-Specific Generation**: Create optimized test commands for mobile, backend, AI services, and web
- **Synchronization Testing**: Generate tests for event-driven architecture and conflict resolution
- **Performance Testing**: Create load testing and performance monitoring configurations
- **Quality Assurance**: Generate code coverage and quality metric tracking

## Usage Patterns

**Basic Generation:**
- `/claudio:test-g` - Generate complete TaskFlow test suite commands
- `/claudio:test-g mobile` - Generate React Native mobile testing commands
- `/claudio:test-g backend` - Generate Node.js API testing commands
- `/claudio:test-g ai` - Generate Python ML service testing commands
- `/claudio:test-g sync` - Generate synchronization and integration tests
- `/claudio:test-g --update` - Update existing test commands with latest patterns

**Platform-Specific Generation:**
- `/claudio:test-g ios` - Generate iOS-specific React Native tests
- `/claudio:test-g android` - Generate Android-specific React Native tests
- `/claudio:test-g web` - Generate React.js web application tests
- `/claudio:test-g microservices` - Generate microservices testing workflows
- `/claudio:test-g e2e` - Generate end-to-end testing across platforms

## Test Command Generation

Use the taskflow-test-generator subagent to:

1. **Project Structure Analysis**:
   - Scan for React Native mobile apps in `mobile/` directory
   - Detect Node.js backend services in `backend/` directory
   - Identify Python AI services in `ai-services/` directory
   - Analyze web application structure in `web/` directory
   - Map microservices architecture and dependencies

2. **Platform-Specific Command Generation**:
   - **React Native**: Generate Jest, Detox, and platform-specific test commands
   - **Node.js**: Generate API testing, integration testing, and microservices commands
   - **Python**: Generate pytest commands with TensorFlow model validation
   - **Web**: Generate React.js testing with PWA functionality validation
   - **Integration**: Generate cross-platform synchronization testing

3. **Testing Infrastructure Creation**:
   - Generate Docker Compose test environments
   - Create test database setup and teardown scripts
   - Generate CI/CD pipeline configurations (GitHub Actions)
   - Create performance testing and monitoring configurations
   - Generate code coverage and quality reporting

4. **Advanced Testing Features**:
   - **Offline-First Testing**: Generate sync reconciliation and conflict resolution tests
   - **AI Model Testing**: Generate TensorFlow model accuracy and performance validation
   - **Real-time Testing**: Generate WebSocket and event-driven architecture tests
   - **Security Testing**: Generate vulnerability scanning and security validation
   - **Load Testing**: Generate performance and scalability testing configurations

**TaskFlow-Specific Optimizations:**
- **Multi-Platform Coordination**: Ensure test commands work across iOS, Android, Web, and Backend
- **Synchronization Validation**: Generate tests for event-driven architecture and conflict resolution
- **AI/ML Integration**: Create comprehensive model testing and validation workflows
- **Performance Monitoring**: Generate tests for productivity metrics and user experience optimization
- **Microservices Testing**: Create service-to-service communication and integration validation

**Generated Command Features:**
- Intelligent test pattern matching based on TaskFlow architecture
- Automated test environment setup and teardown
- Cross-platform test result aggregation and reporting
- Integration with TaskFlow-specific CI/CD pipelines
- Performance benchmarking and productivity metrics tracking