# Deploy Command

## Command
`/claudio:deploy`

## Purpose
Generates comprehensive deployment strategies and configurations for Phoenix LiveView applications across different environments and platforms.

## Usage
```
/claudio:deploy [environment] [--platform] [--automation] [--monitoring]
```

## Arguments
- `environment`: Target environment ("development", "staging", "production")
- `--platform`: Deployment platform ("fly.io", "gigalixir", "docker", "kubernetes")
- `--automation`: Generate CI/CD pipeline automation
- `--monitoring`: Include monitoring and observability configuration

## Agent Reference
Uses `claudio:deploy-coordinator subagent` to orchestrate deployment planning

## Phoenix LiveView Deployment Specializations

### Phoenix Production Configuration
```elixir
# Production-optimized Phoenix configuration
- Runtime configuration with releases
- Database connection pooling optimization
- Asset compilation and optimization
- LiveView production settings and performance tuning
- Secret management and environment variable handling
```

### Platform-Specific Deployment

#### Fly.io Deployment
```dockerfile
# Optimized Fly.io configuration for Phoenix
- Multi-stage Docker builds for Phoenix applications
- Fly.toml configuration for LiveView applications
- Database and Redis integration on Fly.io
- Asset serving and CDN configuration
- Health checks and graceful shutdowns
```

#### Gigalixir Deployment
```elixir
# Gigalixir-specific Phoenix deployment
- Buildpack configuration for Phoenix applications
- Database migration automation
- Environment variable configuration
- Scaling configuration for LiveView applications
- Custom domain and SSL certificate setup
```

#### Docker Containerization
```dockerfile
# Phoenix-optimized Docker configuration
- Multi-stage builds for development and production
- Elixir release optimization
- Asset compilation in containers
- Environment-specific configuration injection
- Health check and monitoring integration
```

### Deployment Automation

#### CI/CD Pipeline Configuration
```yaml
# GitHub Actions / GitLab CI for Phoenix deployment
- Automated testing with ExUnit and coverage reporting
- Credo and Dialyxir quality gates
- Database migration automation
- Asset compilation and optimization
- Multi-environment deployment workflow
```

#### Mix Release Configuration
```elixir
# Optimized Mix releases for production deployment
- Runtime configuration for Phoenix applications
- Release overlays and customization
- Migration automation in releases
- Monitoring and health check integration
- Zero-downtime deployment strategies
```

## Deployment Strategy Components

### Environment Configuration
```markdown
# Environment-specific deployment configurations
- **Development**: Live reload, debugging, development database
- **Staging**: Production-like environment for testing and validation
- **Production**: Optimized performance, security hardening, monitoring
```

### Database Deployment
```elixir
# Phoenix database deployment strategies
- PostgreSQL optimization for Phoenix applications
- Migration automation and rollback strategies
- Database connection pooling configuration
- Backup and disaster recovery planning
- Read replica configuration for scaling
```

### Monitoring & Observability
```elixir
# Phoenix application monitoring
- LiveView performance monitoring
- Database query performance tracking
- Error tracking and alerting
- Application metrics and dashboards
- Log aggregation and analysis
```

## Output Structure
```
deployment/
├── environments/
│   ├── development_config.md           # Development environment setup
│   ├── staging_config.md               # Staging environment configuration
│   └── production_config.md            # Production environment configuration
├── platforms/
│   ├── fly_io_deployment.md           # Fly.io deployment guide and configuration
│   ├── gigalixir_deployment.md        # Gigalixir deployment configuration
│   ├── docker_deployment.md           # Docker containerization guide
│   └── kubernetes_deployment.md        # Kubernetes deployment configuration
├── automation/
│   ├── ci_cd_pipeline.yml             # CI/CD pipeline configuration
│   ├── deployment_scripts.sh          # Automated deployment scripts
│   ├── migration_automation.md        # Database migration automation
│   └── rollback_procedures.md         # Rollback and recovery procedures
├── configuration/
│   ├── runtime_config.exs             # Phoenix runtime configuration
│   ├── release_config.exs             # Mix release configuration
│   ├── environment_variables.md       # Environment variable documentation
│   └── secret_management.md           # Secret and credential management
├── monitoring/
│   ├── application_monitoring.md      # Phoenix application monitoring setup
│   ├── database_monitoring.md         # Database performance monitoring
│   ├── error_tracking.md              # Error tracking and alerting
│   └── performance_dashboards.md      # Performance monitoring dashboards
└── security/
    ├── production_hardening.md        # Production security hardening
    ├── ssl_configuration.md           # SSL/TLS certificate configuration
    ├── firewall_rules.md              # Network security configuration
    └── security_monitoring.md         # Security monitoring and alerting
```

## Integration Benefits
- **Phoenix Optimization**: Deployment strategies specifically optimized for Phoenix LiveView applications
- **Platform Flexibility**: Support for multiple deployment platforms and strategies
- **Automation Ready**: Complete CI/CD pipeline integration with quality gates
- **Production Hardening**: Security and performance optimization for production environments
- **Monitoring Integration**: Comprehensive observability and monitoring configuration