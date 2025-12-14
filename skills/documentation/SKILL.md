---
name: technical-documentation
description: Activate when creating comprehensive documentation including README files, API docs, user guides, and developer guides
license: MIT
---

# Technical Documentation

Guide for creating clear, comprehensive, and user-friendly documentation for software projects, translating technical complexity into accessible content.

## When to Use This Skill

Activate when:
- Creating README files or project overviews
- Documenting APIs with endpoints and examples
- Writing user guides and tutorials
- Creating developer setup documentation
- Building architecture documentation
- Developing troubleshooting guides

## Documentation Process

### Phase 1: Project Understanding
1. Analyze project structure and main entry points
2. Identify core features and functionality
3. Determine target audience (developers, end users, both)
4. Examine existing documentation for gaps
5. Review code comments and inline documentation

### Phase 2: Content Planning
1. Define documentation scope and objectives
2. Create content outline and structure
3. Identify required examples and use cases
4. Plan visual aids (diagrams, code examples)
5. Determine appropriate formats

### Phase 3: Content Creation
1. Write clear, concise explanations
2. Create practical examples and code snippets
3. Include troubleshooting scenarios
4. Add visual elements where helpful
5. Ensure consistent tone and style

## Writing Guidelines

- **Clarity**: Use simple, direct language
- **Consistency**: Maintain uniform terminology and formatting
- **Completeness**: Cover all essential information
- **Accuracy**: Ensure all examples work correctly
- **Accessibility**: Consider different skill levels

## Content Structure

- **Progressive Disclosure**: Start simple, add complexity gradually
- **Scannable Format**: Use headers, lists, and code blocks effectively
- **Practical Examples**: Include real-world usage scenarios
- **Visual Hierarchy**: Use formatting to guide the reader's eye
- **Cross-References**: Link related concepts and sections

## Documentation Types

### README Template
```markdown
# Project Name
Brief, compelling description of what the project does.

## Features
- Key feature 1
- Key feature 2

## Quick Start
[Minimal example to get started]

## Installation
[Step-by-step installation instructions]

## Usage
[Basic usage examples with code]

## API Reference
[Link to detailed API docs]

## Contributing
[How to contribute]

## License
[License information]
```

### API Documentation Template
```markdown
# API Reference

## Overview
[API purpose and capabilities]

## Authentication
[How to authenticate]

## Endpoints

### GET /endpoint
**Description**: [What this endpoint does]

**Parameters**:
- `param1` (string, required): Description

**Example Request**:
GET /api/v1/endpoint?param1=value

**Example Response**:
{
  "data": "example response"
}

**Error Responses**:
- `400`: Bad Request
- `401`: Unauthorized
```

### User Guide Template
```markdown
# User Guide

## Getting Started
[Step-by-step first-time setup]

## Basic Operations
[Common tasks with examples]

## Advanced Features
[Complex functionality explained]

## Troubleshooting
[Common issues and solutions]

## FAQ
[Frequently asked questions]
```

### Developer Guide Template
```markdown
# Developer Guide

## Architecture Overview
[System design and components]

## Development Setup
[Local development environment]

## Code Structure
[Project organization explained]

## Contributing Guidelines
[How to contribute code]

## Testing
[How to run and write tests]

## Deployment
[How to deploy the application]
```

## Key Principles

- **Analyze First**: Examine the codebase before writing
- **User-Centric**: Focus on what users need to know
- **Examples First**: Lead with examples, then explain
- **Iterative**: Start with essential information, then detail
- **Actionable**: Ensure every section has clear next steps
- **Error Prevention**: Anticipate and address common mistakes
