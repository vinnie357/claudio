# Discovery Analysis Patterns and Localization Mappings

This document defines how discovery analysis findings drive resource generation and localization decisions across the Claudio installation system.

## Overview

The discovery-driven generation system uses project analysis findings as **drivers** for all localization decisions. This creates a systematic mapping from discovered project characteristics to specific customizations applied during resource generation.

## Technology Stack Mappings

### **Node.js Projects**
**Discovery Indicators**: `package.json`, `npm`/`yarn`, `node_modules/`
**Drives Localization Patterns**:
- **Commands**: npm/yarn examples, Express patterns, Jest testing
- **Agents**: Node.js-specific analysis capabilities, ESLint integration
- **Context**: Node.js best practices, npm ecosystem patterns
- **Example Substitutions**:
  - `{test_command}` → `npm test`
  - `{lint_command}` → `npm run lint`
  - `{build_command}` → `npm run build`
  - `{start_command}` → `npm start`

### **React Projects**
**Discovery Indicators**: `react` in dependencies, JSX files, `create-react-app`
**Drives Localization Patterns**:
- **Commands**: Component analysis examples, JSX patterns
- **Agents**: React Testing Library integration, component architecture analysis
- **Context**: React design patterns, state management guidance
- **Example Substitutions**:
  - `{component_examples}` → React functional components
  - `{test_framework}` → React Testing Library
  - `{state_management}` → useState, useEffect hooks

### **PostgreSQL Projects**
**Discovery Indicators**: `postgresql`, `pg` package, `.sql` files
**Drives Localization Patterns**:
- **Commands**: Database examples, migration patterns, query examples
- **Agents**: PostgreSQL-specific analysis, schema validation
- **Context**: Database best practices, migration strategies
- **Example Substitutions**:
  - `{database_examples}` → PostgreSQL queries
  - `{migration_examples}` → SQL migration scripts
  - `{connection_patterns}` → pg connection pooling

### **TypeScript Projects**
**Discovery Indicators**: `tsconfig.json`, `.ts` files, TypeScript compiler
**Drives Localization Patterns**:
- **Commands**: TypeScript compilation examples, type checking
- **Agents**: TypeScript analysis capabilities, type inference
- **Context**: TypeScript best practices, type design patterns
- **Example Substitutions**:
  - `{type_examples}` → TypeScript interfaces and types
  - `{compile_command}` → `tsc` or `npm run build`
  - `{type_checking}` → TypeScript strict mode patterns

### **Python Projects**
**Discovery Indicators**: `requirements.txt`, `setup.py`, `.py` files, `venv/`
**Drives Localization Patterns**:
- **Commands**: pip examples, virtual environment patterns, pytest testing
- **Agents**: Python-specific analysis, PEP compliance checking
- **Context**: Python best practices, package management guidance
- **Example Substitutions**:
  - `{test_command}` → `pytest`
  - `{lint_command}` → `flake8` or `black`
  - `{install_command}` → `pip install -r requirements.txt`

## Architecture Mappings

### **Microservices Architecture**
**Discovery Indicators**: Multiple services, Docker Compose, API gateways
**Drives Localization Patterns**:
- **Commands**: Service boundary analysis, API contracts, distributed patterns
- **Agents**: Distributed systems analysis, service communication patterns
- **Context**: Microservices best practices, distributed tracing patterns
- **Architecture Patterns**:
  - Service discovery patterns
  - Inter-service communication
  - Distributed logging and monitoring
  - API versioning strategies

### **Monolith Architecture**
**Discovery Indicators**: Single large codebase, unified deployment
**Drives Localization Patterns**:
- **Commands**: Modular architecture, dependency management, scaling patterns
- **Agents**: Monolith analysis, module boundary detection
- **Context**: Modular design patterns, code organization strategies
- **Architecture Patterns**:
  - Module separation strategies
  - Internal API design
  - Code organization patterns
  - Scaling preparation

### **Serverless Architecture**
**Discovery Indicators**: Lambda functions, serverless framework, FaaS patterns
**Drives Localization Patterns**:
- **Commands**: Function deployment, event-driven patterns
- **Agents**: Serverless analysis, cold start optimization
- **Context**: Serverless best practices, event-driven design
- **Architecture Patterns**:
  - Function composition
  - Event sourcing patterns
  - Stateless design principles
  - Performance optimization

## Domain Mappings

### **E-commerce Domain**
**Discovery Indicators**: Payment processing, inventory management, user accounts
**Drives Localization Patterns**:
- **Commands**: Payment patterns, inventory examples, user management flows
- **Agents**: E-commerce security analysis, user management flows
- **Context**: E-commerce compliance requirements, scalability patterns
- **Domain Patterns**:
  - Payment processing workflows
  - Inventory management strategies
  - User authentication and authorization
  - Order fulfillment patterns

### **Healthcare Domain**
**Discovery Indicators**: HIPAA compliance, patient data, medical records
**Drives Localization Patterns**:
- **Commands**: HIPAA compliance examples, patient data handling
- **Agents**: Healthcare security analysis, regulatory compliance
- **Context**: Healthcare industry patterns, privacy requirements
- **Domain Patterns**:
  - HIPAA compliance workflows
  - Patient data security
  - Audit trail requirements
  - Regulatory reporting

### **Financial Services Domain**
**Discovery Indicators**: Financial transactions, compliance frameworks, security requirements
**Drives Localization Patterns**:
- **Commands**: Financial compliance examples, transaction processing
- **Agents**: Financial security analysis, compliance checking
- **Context**: Financial industry patterns, regulatory requirements
- **Domain Patterns**:
  - Transaction processing security
  - Compliance automation
  - Risk management strategies
  - Audit and reporting frameworks

## Framework-Specific Mappings

### **Express.js Framework**
**Discovery Indicators**: Express in dependencies, route definitions, middleware
**Drives Localization Patterns**:
- **Capabilities**: Express-specific analysis, route optimization, middleware patterns
- **Examples**: Express route handlers, middleware composition, error handling
- **Patterns**: RESTful API design, Express security practices

### **Django Framework**
**Discovery Indicators**: Django in requirements, models.py, views.py
**Drives Localization Patterns**:
- **Capabilities**: Django-specific analysis, ORM optimization, view patterns
- **Examples**: Django models, views, template patterns
- **Patterns**: MVT architecture, Django security practices

### **Spring Boot Framework**
**Discovery Indicators**: Spring Boot dependencies, @SpringBootApplication
**Drives Localization Patterns**:
- **Capabilities**: Spring-specific analysis, dependency injection, configuration
- **Examples**: Spring Boot controllers, services, configuration
- **Patterns**: Spring security, data access patterns

## Testing Framework Mappings

### **Jest Testing Framework**
**Discovery Indicators**: Jest in dependencies, `.test.js` files, Jest configuration
**Drives Localization Patterns**:
- **Commands**: Jest test examples, mocking patterns
- **Agents**: Jest-specific test analysis, coverage reporting
- **Context**: Jest best practices, testing strategies
- **Testing Patterns**:
  - Unit testing with Jest
  - Mocking and stubbing strategies
  - Snapshot testing approaches
  - Coverage optimization

### **pytest Testing Framework**
**Discovery Indicators**: pytest in requirements, `test_*.py` files, pytest.ini
**Drives Localization Patterns**:
- **Commands**: pytest examples, fixture patterns
- **Agents**: pytest-specific analysis, test discovery
- **Context**: pytest best practices, fixture strategies
- **Testing Patterns**:
  - Fixture-based testing
  - Parametrized test cases
  - Plugin integration
  - Test organization strategies

## Build System Mappings

### **Webpack Build System**
**Discovery Indicators**: webpack.config.js, Webpack dependencies
**Drives Localization Patterns**:
- **Commands**: Webpack build examples, optimization patterns
- **Agents**: Webpack analysis, bundle optimization
- **Context**: Webpack best practices, performance optimization
- **Build Patterns**:
  - Bundle splitting strategies
  - Asset optimization
  - Development vs production configs
  - Plugin configuration

### **Vite Build System**
**Discovery Indicators**: vite.config.js, Vite dependencies
**Drives Localization Patterns**:
- **Commands**: Vite build examples, development server patterns
- **Agents**: Vite analysis, build optimization
- **Context**: Vite best practices, modern build strategies
- **Build Patterns**:
  - ES module optimization
  - Hot module replacement
  - Build target configuration
  - Plugin ecosystem

## Localization Rule Engine

### **Pattern Matching Rules**

```yaml
localization_rules:
  technology_patterns:
    nodejs:
      applies_to: ["commands", "agents", "context"]
      substitutions:
        test_command: "npm test"
        lint_command: "npm run lint"
        build_command: "npm run build"
      capability_additions:
        - "package.json analysis"
        - "npm dependency scanning"
        - "Node.js performance optimization"
    
    react:
      applies_to: ["commands", "agents", "context"]
      substitutions:
        component_examples: "React functional components"
        test_framework: "React Testing Library"
        state_management: "useState, useEffect hooks"
      capability_additions:
        - "JSX analysis"
        - "React hook optimization"
        - "Component architecture analysis"

  architecture_patterns:
    microservices:
      applies_to: ["commands", "agents", "context"]
      content_additions:
        - "Service boundary analysis"
        - "Inter-service communication patterns"
        - "Distributed system monitoring"
      example_contexts:
        - "API gateway configuration"
        - "Service discovery patterns"
        - "Distributed tracing setup"
    
    monolith:
      applies_to: ["commands", "agents", "context"]
      content_additions:
        - "Modular architecture patterns"
        - "Code organization strategies"
        - "Internal API design"
      example_contexts:
        - "Module separation strategies"
        - "Dependency management"
        - "Scaling preparation"

  domain_patterns:
    ecommerce:
      applies_to: ["commands", "agents", "context"]
      domain_additions:
        - "Payment processing patterns"
        - "Inventory management strategies"
        - "User authentication flows"
      compliance_requirements:
        - "PCI DSS compliance"
        - "GDPR data handling"
        - "Security audit trails"
```

### **Dynamic Content Generation**

The localization engine applies patterns dynamically based on discovery analysis:

1. **Technology Stack Analysis**: Extract technology drivers from discovery
2. **Architecture Pattern Detection**: Identify architectural style and patterns
3. **Domain Context Recognition**: Understand business domain requirements
4. **Framework Integration**: Detect specific frameworks and tools
5. **Pattern Application**: Apply appropriate localization rules
6. **Content Customization**: Generate technology-appropriate content

### **Validation and Quality Assurance**

- **Pattern Completeness**: Ensure all discovered technologies have localization mappings
- **Consistency Checking**: Verify pattern applications are consistent across resources
- **Quality Validation**: Ensure generated content meets technology-specific standards
- **Coverage Analysis**: Confirm all localization requirements are satisfied

This comprehensive mapping system ensures that every generated resource is optimally customized for the specific project characteristics discovered during analysis, providing immediate relevance and utility for development teams.