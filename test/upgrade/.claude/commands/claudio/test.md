---
description: "Execute TaskFlow project test suite with React Native, Node.js, and Python testing"
argument-hint: "[test_pattern] [--fix]"
---

Execute TaskFlow's comprehensive test suite across multiple technology stacks with intelligent framework detection and fix capabilities.

## TaskFlow Project Testing Configuration

**Technology Stack Detection:**
- **Frontend**: React Native (iOS/Android), React.js (Web), Electron (Desktop)
- **Backend**: Node.js Express microservices with API gateway
- **AI Services**: Python with TensorFlow ML models and analytics
- **Testing Frameworks**: Jest (frontend), pytest (Python), Custom React Native testing

## Command Behavior

**Intelligent TaskFlow Test Execution:**
1. **Detect test context** based on provided pattern or run comprehensive suite
2. **Execute appropriate framework** tests with TaskFlow-specific configurations
3. **Provide intelligent reporting** with cross-platform test result analysis
4. **Handle --fix flag** for automated failure resolution where possible

## Usage Patterns

**Basic Execution:**
- `/claudio:test` - Run complete TaskFlow test suite (all platforms)
- `/claudio:test mobile` - Run React Native tests for iOS/Android
- `/claudio:test backend` - Run Node.js microservices tests
- `/claudio:test ai` - Run Python ML service tests
- `/claudio:test web` - Run React.js web application tests
- `/claudio:test --fix` - Run tests and attempt automated fixes

**Platform-Specific Testing:**
- `/claudio:test ios` - iOS-specific React Native tests
- `/claudio:test android` - Android-specific React Native tests
- `/claudio:test api` - Backend API integration tests
- `/claudio:test ml` - Machine learning model tests
- `/claudio:test sync` - Real-time synchronization tests

## Implementation

I will use Task tool with subagent_type: "taskflow-test-runner" to:

1. **Analyze test pattern** to determine scope (mobile, backend, ai, web, or all)
2. **Execute framework-specific tests** with TaskFlow configurations:
   - **React Native**: Use React Native testing library with platform detection
   - **Node.js Microservices**: Execute Jest/Mocha tests with API integration
   - **Python**: Run pytest with TensorFlow model validation
   - **Web**: Execute React.js tests with PWA functionality
3. **Cross-platform validation** for synchronization and data consistency
4. **Intelligent failure analysis** with TaskFlow-specific error patterns
5. **Automated fix attempts** for common failure scenarios

**TaskFlow-Specific Features:**
- **Microservices Testing**: Individual service validation with integration tests
- **Event-Driven Synchronization**: Real-time sync and conflict resolution testing
- **AI Model Testing**: TensorFlow model accuracy and performance validation  
- **Mobile Platform Testing**: iOS/Android-specific feature validation
- **Offline-First Testing**: Sync reconciliation and conflict resolution testing

**Performance & Quality Metrics:**
- Test execution time across platforms and services
- Coverage reports for each technology stack
- Synchronization conflict resolution success rates
- AI model prediction accuracy metrics
- Mobile app performance benchmarks