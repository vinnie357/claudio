# Research Workflow Testing

This directory contains test cases and validation scenarios for the Claudio research system.

## Directory Structure

- **`test_scenarios/`** - Sample research request scenarios for testing
- **`.claudio/`** - Test project structure for direct command usage validation
- **`expected_outputs/`** - Reference examples of expected research document structure

## Purpose

Test and validate that:
1. `/claudio:research` command creates documents in correct locations
2. Research-specialist subagent creates documents in extended_context
3. Both overview.md and troubleshooting.md files are generated
4. Document structure follows established templates
5. Content quality meets Claudio standards

## Usage

Run tests using `../agent_research_test.md` validation scenarios.