# Quality Command

## Command
`/claudio:quality`

## Purpose
Performs comprehensive code quality analysis for Phoenix LiveView applications including security review, performance assessment, and adherence to Elixir/Phoenix best practices.

## Usage
```
/claudio:quality [target] [--security] [--performance] [--comprehensive]
```

## Arguments
- `target`: Specific module, component, or directory to analyze
- `--security`: Focus on security vulnerability assessment
- `--performance`: Focus on performance optimization analysis
- `--comprehensive`: Complete quality analysis across all dimensions

## Agent Reference
Uses `claudio:code-quality-analyzer subagent` to coordinate comprehensive quality assessment

## Phoenix LiveView Quality Analysis

### Code Quality Assessment
```elixir
# Phoenix-specific quality checks
- Credo rule compliance and code style consistency
- Dialyxir static analysis and type checking
- Phoenix convention adherence
- LiveView best practice implementation
- Elixir idiom usage and OTP patterns
```

### Security Analysis
```elixir
# Security vulnerability assessment
- Phoenix security best practices compliance
- CSRF and authentication pattern analysis
- Input validation and sanitization review
- LiveView security pattern verification
- Ecto query injection prevention analysis
```

### Performance Assessment
```elixir
# Performance optimization analysis
- LiveView performance patterns and optimization
- Database query efficiency and N+1 detection
- Phoenix template and component rendering optimization
- Asset pipeline and Tailwind CSS efficiency
- Memory usage and process optimization
```

## Quality Dimensions

### Code Structure
```markdown
# Evaluates code organization and structure
- **Module Organization**: Phoenix application structure adherence
- **Function Design**: Single responsibility and composability
- **Component Architecture**: Phoenix.Component design patterns
- **State Management**: LiveView state handling best practices
```

### Testing Quality
```markdown
# Assesses testing comprehensiveness and quality
- **Test Coverage**: ExUnit coverage analysis and improvement recommendations
- **Test Design**: Testing pattern quality and maintainability
- **Integration Testing**: LiveView and integration test effectiveness
- **Test Performance**: Test suite performance and optimization
```

### Documentation Quality
```markdown
# Evaluates documentation completeness and quality
- **Module Documentation**: @moduledoc and @doc coverage
- **Function Specs**: @spec coverage and accuracy
- **README Quality**: Project documentation completeness
- **API Documentation**: Phoenix API documentation quality
```

## Phoenix-Specific Quality Checks

### LiveView Patterns
```elixir
# LiveView-specific quality analysis
- Component state management efficiency
- Event handling pattern optimization
- LiveView lifecycle hook usage
- Phoenix.Component design pattern adherence
- Real-time functionality implementation quality
```

### Elixir/OTP Best Practices
```elixir
# Elixir ecosystem quality checks  
- OTP application design pattern compliance
- GenServer and process management best practices
- Supervisor tree design and fault tolerance
- Ecto schema and changeset design quality
- Mix task implementation and organization
```

### Phoenix Framework Integration
```elixir
# Phoenix framework quality assessment
- Controller design and REST pattern compliance
- Router organization and route efficiency
- Phoenix context boundary implementation
- Plug usage and custom plug design
- Phoenix configuration and environment management
```

## Output Structure
```
quality_analysis/
├── overview/
│   ├── quality_summary.md              # Overall quality assessment
│   ├── improvement_roadmap.md          # Prioritized improvement plan
│   └── compliance_report.md            # Standards compliance report
├── code_quality/
│   ├── credo_analysis.md               # Credo rule compliance
│   ├── dialyxir_analysis.md           # Static analysis results
│   ├── pattern_analysis.md            # Phoenix pattern compliance
│   └── refactoring_suggestions.md     # Code improvement recommendations
├── security/
│   ├── vulnerability_assessment.md     # Security vulnerability analysis
│   ├── phoenix_security_review.md     # Phoenix-specific security checks
│   ├── authentication_analysis.md     # Auth pattern security review
│   └── data_protection_review.md      # Data handling security analysis
├── performance/
│   ├── performance_analysis.md         # Performance bottleneck identification
│   ├── database_optimization.md        # Ecto and database optimization
│   ├── liveview_optimization.md       # LiveView performance optimization
│   └── asset_optimization.md          # Asset pipeline optimization
└── testing/
    ├── coverage_analysis.md            # Test coverage assessment
    ├── test_quality_review.md         # Test design and quality analysis
    ├── testing_strategy.md            # Testing approach evaluation
    └── test_performance.md            # Test suite performance analysis
```

## Integration Benefits
- **Development Standards**: Establishes and maintains high Phoenix development standards
- **Security Assurance**: Comprehensive security analysis specific to Phoenix applications
- **Performance Optimization**: Identifies and addresses performance bottlenecks
- **Quality Culture**: Promotes quality-focused development practices in Phoenix teams
- **Continuous Improvement**: Provides actionable improvement recommendations for ongoing quality enhancement