# Direct Command Test Scenario

## Test Case: Direct Research Command Usage

**Command:** `/claudio:research development nodejs-testing`

**Expected Behavior:**
- Create directory: `test/research/.claudio/research/development/nodejs-testing/`
- Create files:
  - `overview.md` - Comprehensive Node.js testing overview
  - `troubleshooting.md` - Common testing issues and solutions

**Success Criteria:**
- Both files exist in correct location
- Files follow template structure
- Content is relevant to Node.js testing
- Complexity assessment is included
- Sources are referenced

## Test Environment
This test should be run from within the `test/research/` directory to simulate a project with a `.claudio/` folder.