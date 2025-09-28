---
description: "Execute code quality assessment for TaskFlow productivity app with React Native and Node.js tool detection"
argument-hint: "<assessment_type> [project_path] [report_format]"
---

Execute code quality assessment for TaskFlow productivity app by running project-specific linting, formatting, and testing tools with factual analysis based on actual tool outputs.

**CRITICAL: NEVER fabricate quality metrics or results. Only report actual tool execution outputs and real findings.**

**Assessment Types:**
- `full`: Assessment with all available TaskFlow tools (ESLint, Prettier, Jest, React Native tools)
- `lint`: Static analysis and linting only (ESLint, React Native linting)
- `format`: Code formatting assessment only (Prettier, React Native formatting)
- `test`: Test execution with coverage analysis (Jest, React Native testing)
- `complexity`: Complexity and maintainability analysis for React Native and Node.js
- `coverage`: Coverage gap analysis across mobile and backend components
- `quick`: Essential metrics for rapid TaskFlow development feedback

**TaskFlow-Specific Quality Tools:**
- **React Native**: Metro bundler analysis, platform-specific code quality, mobile performance metrics
- **Node.js**: Express.js API quality, microservices patterns, database query optimization
- **JavaScript/TypeScript**: ESLint with React Native rules, Prettier formatting, Jest testing
- **Mobile Quality**: React Native performance analysis, bundle size optimization, memory usage

**Note**: Optional command for enhanced TaskFlow project-specific quality analysis.

Task with subagent_type: "code-quality-analyzer" - pass the project_path argument for TaskFlow project-aware tool detection to execute appropriate quality tools and generate factual reports based on actual analysis.