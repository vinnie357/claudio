---
description: "Generate comprehensive TaskFlow productivity app documentation with parallel creation by type"
argument-hint: "<doc_type> [project_path]"
---

Analyze TaskFlow productivity app and generate clear, comprehensive documentation including README, API docs, user guides, and developer documentation through parallel creation for maximum efficiency.

**Documentation Types:**
- `readme`: TaskFlow project README with overview and quick start
- `api`: TaskFlow API reference documentation for Node.js services
- `user`: TaskFlow user guide and tutorials for mobile and web apps
- `developer`: TaskFlow developer setup and React Native/Node.js architecture guide
- `full`: Complete TaskFlow documentation suite

**TaskFlow-Specific Documentation:**
- **Mobile Documentation**: React Native setup, platform-specific features, offline capabilities
- **Backend Documentation**: Node.js microservices, API endpoints, database schemas
- **Architecture Documentation**: Microservices patterns, synchronization mechanisms, event-driven design
- **User Experience**: TaskFlow app usage, productivity features, cross-platform functionality

Task with subagent_type: "documentation-coordinator" - pass the project_path argument to orchestrate parallel TaskFlow documentation creation by specialized sub-agents.