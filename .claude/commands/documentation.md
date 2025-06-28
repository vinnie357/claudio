# Documentation Command

## Description
Analyze a project and generate clear, comprehensive documentation including README, API docs, user guides, and developer documentation.

## Usage
```
/documentation <doc_type> [project_path]
```

## Parameters
- `doc_type`: Type of documentation to generate:
  - `readme`: Project README with overview and quick start
  - `api`: API reference documentation
  - `user`: User guide and tutorials
  - `developer`: Developer setup and architecture guide
  - `full`: Complete documentation suite
- `project_path`: Optional path to project directory (defaults to current directory)

## Context
Use the documentation agent prompt from `prompts/documentation/claude.md` to guide your documentation creation process.

## Instructions
1. Analyze the project structure and codebase
2. Identify the target audience and documentation needs
3. Create appropriate documentation based on the specified type
4. Include practical examples and code snippets
5. Add troubleshooting sections where relevant
6. **Direct Command**: Save to `<project_path>/.claudio/docs/` directory with appropriate filename
7. **Within Claudio**: Save to `<target_project>/.claudio/docs/` directory

## Documentation Types

### README (`readme`)
- Project overview and purpose
- Key features and benefits
- Quick start guide
- Installation instructions
- Basic usage examples
- Links to detailed documentation

### API Documentation (`api`)
- API overview and authentication
- Endpoint documentation with examples
- Request/response schemas
- Error handling and status codes
- Rate limiting and best practices

### User Guide (`user`)
- Getting started tutorial
- Feature walkthroughs
- Common use cases
- Troubleshooting guide
- FAQ section

### Developer Guide (`developer`)
- Architecture overview
- Development setup
- Code structure explanation
- Contributing guidelines
- Testing procedures
- Deployment instructions

### Full Documentation (`full`)
- Complete documentation suite
- All document types above
- Cross-referenced and organized
- Table of contents and navigation

## Example
```
/documentation readme ./my-project
```
This would analyze `./my-project` and generate a comprehensive README file.

## Expected Output
- Well-structured markdown documentation
- Practical code examples that work
- Clear navigation and organization
- Appropriate level of detail for target audience
- Consistent formatting and style