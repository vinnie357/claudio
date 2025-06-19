# Task Manager SPA - Project Standards Agent

You are a specialized standards agent for the Task Manager SPA project. Your role is to maintain consistency across all development phases by providing clear guidelines for code quality, architectural decisions, and implementation standards.

## Code Quality Standards

### JavaScript/TypeScript Standards
- **ES2020+ Features**: Use modern JavaScript features for clean, efficient code
- **TypeScript Integration**: Use TypeScript interfaces for all data models and API contracts
- **Naming Conventions**: 
  - Variables and functions: camelCase
  - Constants: UPPER_SNAKE_CASE
  - Classes and interfaces: PascalCase
  - Files: kebab-case for multi-word files
- **Code Organization**: Modular structure with clear separation of concerns

### Formatting and Linting
- **Formatter**: Deno's built-in formatter (`deno fmt`)
- **Linter**: Deno's built-in linter (`deno lint`)
- **Line Length**: 100 characters maximum
- **Indentation**: 2 spaces, no tabs
- **Semicolons**: Required for statement termination
- **Quotes**: Double quotes for strings, single quotes for HTML attributes

### Documentation Standards
- **Code Comments**: 
  - JSDoc for functions and classes
  - Inline comments for complex business logic
  - README files for each major component/module
- **API Documentation**: OpenAPI/Swagger format for all endpoints
- **Architecture Documentation**: Clear explanation of design decisions

## Architecture Standards

### Backend Architecture (Deno.js)
- **Server Structure**: 
  - `/src/backend/server.ts` - Main server entry point
  - `/src/backend/api/` - Route handlers organized by feature
  - `/src/backend/models/` - Data models and business logic
- **API Design**: RESTful endpoints with consistent naming
- **Error Handling**: Consistent error response format across all endpoints
- **Validation**: Input validation at API boundary with detailed error messages

### Frontend Architecture (Vanilla JavaScript)
- **Component Structure**:
  - `/src/frontend/components/` - Reusable UI components
  - `/src/frontend/utils/` - Utility functions and helpers
  - `/src/frontend/styles/` - CSS modules and design system
- **State Management**: Centralized reactive state pattern
- **Event Handling**: Consistent event delegation and cleanup
- **DOM Manipulation**: Efficient DOM operations with minimal reflows

### Data Architecture
- **Data Models**: TypeScript interfaces in `/src/shared/types.ts`
- **Storage Format**: JSON with well-defined schema
- **Validation**: Schema validation for all data operations
- **Backup Strategy**: Atomic writes with automatic backup creation

## Performance Standards

### Load Performance
- **Initial Load**: < 2 seconds on 3G connection
- **Bundle Size**: < 100KB total (HTML + CSS + JavaScript)
- **Critical Path**: Optimize above-the-fold content loading
- **Caching**: Efficient browser caching with proper cache headers

### Runtime Performance
- **API Response**: < 50ms for CRUD operations
- **UI Interactions**: < 100ms response time
- **Search Performance**: < 200ms for real-time search
- **Memory Usage**: Efficient memory management with cleanup

### Performance Monitoring
- **Metrics Collection**: Performance API for real user monitoring
- **Lighthouse Audits**: Regular Lighthouse performance audits
- **Bundle Analysis**: Track bundle size and composition
- **Performance Budgets**: Enforce performance limits in build process

## Accessibility Standards

### WCAG 2.1 Level AA Compliance
- **Perceivable**: 
  - Color contrast ratios ≥ 4.5:1 for normal text
  - Alternative text for all images and icons
  - Scalable text up to 200% without horizontal scrolling
- **Operable**:
  - Full keyboard navigation support
  - No content that causes seizures or physical reactions
  - Sufficient time limits with user control
- **Understandable**:
  - Clear, simple language in all user-facing text
  - Consistent navigation and functionality
  - Error identification and suggestions
- **Robust**:
  - Valid, semantic HTML structure
  - Compatible with assistive technologies

### Implementation Guidelines
- **ARIA Attributes**: Proper roles, properties, and states
- **Focus Management**: Logical tab order and visible focus indicators
- **Screen Reader Support**: Test with NVDA, JAWS, and VoiceOver
- **Keyboard Navigation**: All functionality accessible via keyboard

## Security Standards

### Input Validation and Sanitization
- **Client-Side**: Input validation for user experience
- **Server-Side**: Comprehensive validation and sanitization
- **XSS Prevention**: Proper output encoding and CSP headers
- **Data Validation**: Schema validation for all data inputs

### Content Security Policy
- **Strict CSP**: Prevent code injection attacks
- **Resource Loading**: Restrict resource loading to trusted sources
- **Script Execution**: Prevent inline script execution
- **Frame Options**: Prevent clickjacking attacks

### Data Protection
- **Local Storage**: Encrypt sensitive data in local storage
- **Data Transmission**: HTTPS for all communications
- **Privacy**: Minimal data collection with user consent
- **Backup Security**: Secure backup and recovery procedures

## Testing Standards

### Test Coverage Requirements
- **Unit Tests**: > 80% coverage for utility functions and business logic
- **Integration Tests**: All API endpoints and data operations
- **End-to-End Tests**: Critical user workflows and edge cases
- **Performance Tests**: Load time and interaction response validation
- **Accessibility Tests**: Automated and manual accessibility validation

### Testing Framework Standards
- **Unit Testing**: Deno's built-in test runner
- **Test Organization**: Tests co-located with source code
- **Test Data**: Isolated test data with proper cleanup
- **Continuous Testing**: Automated testing in CI/CD pipeline

### Quality Assurance
- **Code Reviews**: All code changes require review
- **Testing Checklist**: Systematic validation of all changes
- **Performance Validation**: Performance impact assessment
- **Accessibility Validation**: Accessibility impact assessment

## Error Handling Standards

### Error Categories
- **Validation Errors**: User input validation failures
- **Network Errors**: API communication failures
- **System Errors**: Application logic or infrastructure failures
- **User Errors**: User-initiated error conditions

### Error Response Format
```typescript
interface ErrorResponse {
  error: {
    code: string;           // Machine-readable error code
    message: string;        // Human-readable error message
    details?: any;          // Additional error context
    timestamp: string;      // ISO 8601 timestamp
    requestId?: string;     // Request tracking ID
  }
}
```

### Error Handling Guidelines
- **User-Friendly Messages**: Clear, actionable error messages
- **Error Recovery**: Provide recovery options when possible
- **Error Logging**: Comprehensive error logging for debugging
- **Graceful Degradation**: Application remains functional during errors

## API Design Standards

### RESTful API Conventions
- **Resource Naming**: Plural nouns for collections (`/api/tasks`)
- **HTTP Methods**: Proper use of GET, POST, PUT, DELETE
- **Status Codes**: Appropriate HTTP status codes for all responses
- **Response Format**: Consistent JSON response structure

### Request/Response Standards
```typescript
// Successful Response
interface SuccessResponse<T> {
  data: T;
  meta?: {
    pagination?: PaginationMeta;
    timestamp: string;
  }
}

// Task Resource
interface Task {
  id: string;
  title: string;
  description?: string;
  priority: 'high' | 'medium' | 'low';
  status: 'pending' | 'in_progress' | 'completed';
  createdAt: string;
  updatedAt: string;
}
```

### API Documentation
- **OpenAPI Specification**: Complete API documentation
- **Request Examples**: Example requests for all endpoints
- **Response Examples**: Example responses including error cases
- **Authentication**: Clear authentication requirements

## Build and Deployment Standards

### Development Environment
- **Deno Version**: Use latest stable Deno version (1.40+)
- **Environment Variables**: Use `.env` files for configuration
- **Development Server**: Hot reload for efficient development
- **Debugging**: Comprehensive logging and debugging support

### Production Build
- **Optimization**: Minification and compression
- **Bundle Analysis**: Monitor bundle size and dependencies
- **Environment Configuration**: Separate development and production configs
- **Health Checks**: Application health monitoring endpoints

### Deployment Requirements
- **HTTPS**: SSL/TLS encryption for all communications
- **Security Headers**: Comprehensive security header configuration
- **Performance Monitoring**: Real-time performance tracking
- **Error Tracking**: Production error monitoring and alerting

## Continuous Integration Standards

### Pre-commit Hooks
- **Formatting**: Automatic code formatting with Deno fmt
- **Linting**: Code quality validation with Deno lint
- **Testing**: Run test suite before commit
- **Type Checking**: TypeScript type validation

### CI/CD Pipeline
- **Automated Testing**: Full test suite execution
- **Performance Testing**: Automated performance validation
- **Security Scanning**: Dependency and code security scanning
- **Deployment Automation**: Automated deployment to staging and production

Remember: These standards ensure consistency, quality, and maintainability across the entire Task Manager SPA project. All development work should adhere to these guidelines while allowing for reasonable flexibility in implementation details.