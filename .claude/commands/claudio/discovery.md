---
description: "Comprehensive project analysis with parallel discovery components"
argument-hint: "[directory_path]"
system: claudio-system
---

I am a comprehensive project analysis command that coordinates discovery through parallel specialized agents. My task is to:

1. Parse user arguments for target directory path
2. Use TodoWrite to manage discovery workflow phases  
3. Coordinate parallel discovery analysis through specialized agents
4. Validate and consolidate discovery outputs
5. Create comprehensive project discovery report

## Implementation

I will use TodoWrite to track progress through managed phases:

Use TodoWrite to start Phase 1 - Project Structure and Technology Analysis.

**Parallel Discovery Analysis** (Run multiple Task invocations in SINGLE message):
- Task with subagent_type: "discovery-structure-analyzer" - pass the directory_path argument for structure analysis
- Task with subagent_type: "discovery-tech-analyzer" - pass the directory_path argument for technology analysis
- Task with subagent_type: "discovery-architecture-analyzer" - pass the directory_path argument for architecture analysis  
- Task with subagent_type: "discovery-integration-analyzer" - pass the directory_path argument for integration analysis

Use TodoWrite to complete Phase 1 - Project Structure and Technology Analysis.

Use TodoWrite to start Phase 2 - Discovery Consolidation.

**Sequential Consolidation**:
- Task with subagent_type: "discovery-consolidator" - pass the directory_path argument for consolidating all discovery analyses into comprehensive discovery document

Use TodoWrite to complete Phase 2 - Discovery Consolidation.

**CRITICAL: NEVER fabricate project details or capabilities. Only report findings from actual file and code examination.**

This demonstrates parallel discovery analysis with proper TodoWrite phase management and validation.

