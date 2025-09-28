# Security Command

## Command
`/claudio:security`

## Purpose
Conducts comprehensive security analysis for Phoenix LiveView applications, identifying vulnerabilities and providing security hardening recommendations.

## Usage
```
/claudio:security [scope] [--audit] [--compliance] [--remediation]
```

## Arguments
- `scope`: Security analysis scope ("authentication", "data", "infrastructure", "all")
- `--audit`: Comprehensive security audit with detailed findings
- `--compliance`: Focus on compliance with security standards and frameworks
- `--remediation`: Generate detailed remediation plans for identified vulnerabilities

## Agent Reference
Uses `claudio:security-review-coordinator subagent` to orchestrate security analysis

## Phoenix LiveView Security Analysis

### Authentication & Authorization
```elixir
# Phoenix authentication security review
- Guardian/Pow authentication implementation analysis
- Session management and security configuration
- CSRF protection and token validation
- LiveView authentication pattern security
- Role-based access control implementation
```

### Data Protection
```elixir
# Data security and privacy analysis
- Ecto parameter sanitization and validation
- Database connection security configuration
- Sensitive data handling and encryption
- GDPR and privacy compliance assessment
- Data retention and deletion policy compliance
```

### Web Application Security
```elixir
# Phoenix web security analysis
- XSS prevention in LiveView and templates
- SQL injection prevention in Ecto queries
- Content Security Policy configuration
- HTTPS enforcement and TLS configuration
- Input validation and sanitization patterns
```

## Security Assessment Categories

### OWASP Top 10 Analysis
```markdown
# OWASP compliance assessment for Phoenix applications
- **Injection Attacks**: Ecto query security and parameterization
- **Broken Authentication**: Phoenix authentication pattern security
- **Sensitive Data Exposure**: Data encryption and secure transmission
- **XML External Entities**: Phoenix XML handling security
- **Broken Access Control**: LiveView authorization patterns
- **Security Misconfiguration**: Phoenix production configuration security
- **Cross-Site Scripting**: Template and LiveView XSS prevention
- **Insecure Deserialization**: Phoenix serialization security
- **Known Vulnerabilities**: Dependency vulnerability assessment
- **Insufficient Logging**: Phoenix security logging implementation
```

### Phoenix-Specific Security
```elixir
# Phoenix framework security best practices
- Phoenix.Token security implementation
- LiveView socket authentication security
- Phoenix channel authentication and authorization
- Plug security middleware configuration
- Phoenix configuration security (secrets, environment variables)
```

### Infrastructure Security
```elixir
# Deployment and infrastructure security
- Production configuration security hardening
- Database security configuration
- Asset pipeline security (CSP, SRI)
- Docker/container security (if applicable)
- CI/CD pipeline security assessment
```

## Vulnerability Assessment

### Code Security Analysis
```elixir
# Static code analysis for security vulnerabilities
- Dangerous function usage detection
- Unsafe Ecto query patterns
- Insecure Phoenix configuration patterns
- Hardcoded secrets and credential detection
- Unsafe LiveView event handling patterns
```

### Dependency Security
```elixir
# Third-party dependency security analysis
- Known vulnerability scanning in mix.exs dependencies
- Outdated dependency security risk assessment
- Hex package security evaluation
- License compliance and security implications
- Supply chain security analysis
```

### Configuration Security
```elixir
# Phoenix configuration security review
- Production secrets management
- Database connection security
- Session configuration security
- CORS policy security analysis
- Environment variable security handling
```

## Output Structure
```
security_analysis/
├── executive_summary/
│   ├── security_assessment.md          # High-level security posture assessment
│   ├── risk_prioritization.md          # Risk-based vulnerability prioritization
│   └── compliance_status.md            # Compliance framework status
├── vulnerabilities/
│   ├── critical_findings.md            # Critical security vulnerabilities
│   ├── high_risk_findings.md          # High-risk security issues
│   ├── medium_risk_findings.md        # Medium-risk security concerns
│   └── informational_findings.md      # Informational security observations
├── analysis/
│   ├── authentication_security.md     # Authentication system security analysis
│   ├── data_protection_analysis.md    # Data security and privacy analysis
│   ├── web_security_analysis.md       # Web application security assessment
│   ├── infrastructure_security.md     # Infrastructure and deployment security
│   └── dependency_security.md         # Third-party dependency security analysis
├── remediation/
│   ├── immediate_actions.md           # Critical fixes requiring immediate attention
│   ├── short_term_plan.md            # Short-term security improvements
│   ├── long_term_strategy.md         # Long-term security enhancement strategy
│   └── implementation_guide.md        # Detailed remediation implementation guide
└── compliance/
    ├── owasp_compliance.md            # OWASP Top 10 compliance assessment
    ├── privacy_compliance.md          # GDPR/privacy regulation compliance
    ├── industry_standards.md          # Industry-specific security standards
    └── audit_checklist.md             # Security audit checklist and verification
```

## Integration Benefits
- **Proactive Security**: Identifies security vulnerabilities before they can be exploited
- **Phoenix Expertise**: Security analysis specifically tailored for Phoenix LiveView applications
- **Compliance Assurance**: Helps maintain compliance with security standards and regulations
- **Risk Management**: Provides risk-based prioritization of security improvements
- **Development Integration**: Security recommendations integrated with Phoenix development workflow