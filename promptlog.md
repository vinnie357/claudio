# gcms 

https://docs.anthropic.com/en/docs/claude-code/slash-commands#custom-slash-commands
https://docs.anthropic.com/en/docs/claude-code/sub-agents#file-format

File format
Each subagent is defined in a Markdown file with this structure:


Copy
---
name: your-sub-agent-name
description: Description of when this subagent should be invoked
tools: tool1, tool2, tool3  # Optional - inherits all tools if omitted
---

Your subagent's system prompt goes here. This can be multiple paragraphs
and should clearly define the subagent's role, capabilities, and approach
to solving problems.

Include specific instructions, best practices, and any constraints
the subagent should follow.  
--- 
use these resources to create a custom /command named /gcms
git commit message short should, invoke a custom subagent that is responsible for comparing
the current git status, and suggesting a brief conventional commit message

# newprompt update to agents

https://docs.anthropic.com/en/docs/claude-code/slash-commands#custom-slash-commands
https://docs.anthropic.com/en/docs/claude-code/sub-agents#file-format

File format
Each subagent is defined in a Markdown file with this structure:

---
name: your-sub-agent-name
description: Description of when this subagent should be invoked
tools: tool1, tool2, tool3  # Optional - inherits all tools if omitted
---

Your subagent's system prompt goes here. This can be multiple paragraphs
and should clearly define the subagent's role, capabilities, and approach
to solving problems.

Include specific instructions, best practices, and any constraints
the subagent should follow.  
--- 

use these resources to review the current newprompt command, after the analysis update the command and its related sub agents with the following:

a new prompt should now follow the command + sub agent pattern with its extended context stored in the prompts/<newpromptname> folder.
this pattern produces:
.claudio/commands/<newpromptname>.md - the command for invoking the task
.claudio/agents/<newpromptname>.md - the sub agent invoked by the command
prompts/<newpromptname>/<newpromptname>.md - extended context made available to sub agent

when creating a new prompt if the new command can do parallel or asynchronous tasks it should create a cordinator sub agent for its work, that manages multiple sub agents to run the command in parallel or asynchronously. this becomes the command + coordinator + [n] sub agents pattern. 

this pattern produces:

.claudio/commands/<newpromptname>.md - the command for invoking the task
.claudio/agents/<newpromptname>-coordinator.md - the sub agent invoked by the command, that invokes the requires parallel subagents
.claudio/agents/<newpromptname>-sub-agent-1.md - sub agent invoked by the coordinator
.claudio/agents/<newpromptname>-sub-agent-2.md - sub agent invoked by the coordinator
prompts/<newpromptname>/<newpromptname>.md - extended context made available to the relevant sub agent


 
# create the install command

use the /newprompt command and its sub agents to create a new /install command 

/install  ( user | project | path )  default project

install claudio - runs the full workflow and includes installing commands and agents ONLY avaliable in project or path mode

install commands - only installs the commands, subagents, and related prompts available in all install types

the related prompts in user mode are placed in ~/.claude/agents/claudio/prompts/<prompt>
in all other modes the prompts are placed in <path | project>/.claudio/prompts/<prompt>

user:

install files to:
~/.claude/commands/claudio/<command>.md
~/.claude/agents/claudio/<command>.md
tell the user the session needs rights in ~/.claude

project:

eg: <project> - assumes current working directory

install files to:
 <project>/.claude/commands/claudio/<command>.md
<project>/.claude/agents/claudio/<command>.md
tell the user the session needs rights in <project>/.claude

path:

eg: /github/mycode/ or ./ - user specified path

install files to:
 <path>/.claude/commands/claudio/<command>.md
<path>/.claude/agents/claudio/<command>.md
tell the user the session needs rights in <path>/.claude

create a validation sub agent for the install, that checks for all relevant files after any install pattern is complete before showing the user a list of what was installed and where.

/install - defaults to project and full workflow

/install commands - defaults to project

/install commands user - installs to ~/ 

/install /path/to/code - runs full workflow and installs commands and agents

/install commands /path/to/code - installs commands only in the specified path


we need to ensure our commands know how to referecne their subagents correctly in folders, as well as their extended prompt context documents

when refrenced by a command the subagent can be called by claudio:<sub agent name> 
when a sub agent is refrencing the extended prompts they have to reference the prompts locations which depends on the install, they can be at <project>/.claudio/prompts/<prompt> or ~/.claude/agents/claudio/prompts<prompt>

# update existing commands using the new subagent patterns and parallel patterns

review the /newprompt command

review existing commands

suggest updates to the existing commands to follow the new sub agent patterns where possible 

# session crashed with bug, restarted

review the /newprompt command

review existing commands

suggest updates to the existing commands to follow the new sub agent patterns where possible 



🔄 Remaining Updates Needed                                                                                                      
                                                                                                                                      
     The following commands still need to be updated to follow the modern patterns:                                                   
               
     High Priority:                                                                                                                 
     - /prd - Should use specialized PRD creation by type (feature, enhancement, integration, migration, full)                        
                                                                                                                                      
     Medium Priority:                                                                                                                  
     - /discovery - Could benefit from parallel analysis components (tech analysis, MCP recommendations, architecture assessment)     
     - /task - Could use parallel task processing (phase analysis, context creation, structure building)                              
     - /plan - Could benefit from parallel planning components (phase creation, resource estimation, risk analysis)                   
                                                                                                                                      
     Low Priority:                                                                                                        
     - /research, /design, /code-quality - Simple conversions to frontmatter + single sub-agent pattern

     https://docs.anthropic.com/en/docs/claude-code/sub-agents#file-format

File format
Each subagent is defined in a Markdown file with this structure:

---
name: your-sub-agent-name
description: Description of when this subagent should be invoked
tools: tool1, tool2, tool3  # Optional - inherits all tools if omitted
---

Your subagent's system prompt goes here. This can be multiple paragraphs
and should clearly define the subagent's role, capabilities, and approach
to solving problems.

Include specific instructions, best practices, and any constraints
the subagent should follow. 

ensure the agents follow this pattern

any extended context from the original commands should be moved to their respective prompt location and addressible by the agent

the extended detail and detailed examples that were removed must be available in each commands respective prompt folder document 

review the git diff, for the commands that were changed, then ensure no extended detail was lost, if it was place it into each commands corresponding prompt documentation and make sure their sub agent is aware of the file, the most imporant aspects are the file structure and validation of file creation, and any ALLWAYS or NEVER instructions

the design command needs the same treatment

review the git diff, for the commands that were changed, then ensure no extended detail was lost, if it was place it into each commands corresponding prompt documentation and make sure their sub agent is aware of the file, the most imporant aspects are the file structure and validation of file creation, and any ALLWAYS or NEVER instructions

# compacted

https://docs.anthropic.com/en/docs/claude-code/sub-agents#file-format

File format
Each subagent is defined in a Markdown file with this structure:

---
name: your-sub-agent-name
description: Description of when this subagent should be invoked
tools: tool1, tool2, tool3  # Optional - inherits all tools if omitted
---

Your subagent's system prompt goes here. This can be multiple paragraphs
and should clearly define the subagent's role, capabilities, and approach
to solving problems.

Include specific instructions, best practices, and any constraints
the subagent should follow. 

ensure the agents follow this pattern

any extended context from the original commands should be moved to their respective prompt location and addressible by the agent

during the process referneces to a generic subagent were created this is incorrect, every command using the command + agent pattern or the command + coordinator sub agent + (n)agents pattern should have its own dedicated subagent defined, and each of those should be able to refrence extended context in the respective prompts folder

# ensure agent access and prompt access

when installing commands, they need to refrence the sub agents in the claudio:<agent-name> format
when used directly they will just be <agent-name>

ensure all commands refrence real sub agents

unifi the location by making them all follow the .claude/claudio/<resource> format, this means moving the existing commands. to match these locations.

.claude/agents/claudio/<agent>
.claude/agents/claudio/prompts/<prompt>
.claude/commands/claudio/<command>


# review the git diff, for commands, and prompts

do a git diff on each command , and each prompt
ensure there is no missing context from the conversion, that should be present in the extended context.

ensure that the install command is using the new unified folder structure for commands prompts and sub agents, the project specific files like docs and tasks will still go to .claudio/

address 
  ⚠️ Minor Context Gaps Identified:

  1. PRD Command: Original command had specific PRD types (feature, enhancement, integration) that should be verified in the prompt
  2. Install Command: Already uses correct claudio:install-coordinator format

review the subagents .claude/agents/claudio/install-* ensure the have the new folder structure when creating agents or commands or prompts

check all the prompts and make sure they are named correctly, and make sure the process that makes new prompts makes the new       │
│   names correctly

continue, this makes the format
.claude/agents/claudio/prompts/<prompt>/claude.md

ensure the newprompt command and agents use this new file naming and folder structure

# addtional verification

go one by one through each command, ensure there is a flow from command to agent or agents, and each agent should have access to an extended context in prompts

<!-- # propagation plan

each prompt folder, should contain a readme that would enable someone
to recreate the relevent command and sub agent. 
example file layout:
 prompts/<prompt> - extended detailed examples and instructions for the command and agents
 prompts/readme.md - documentation about the command and its agents to enable recreation -->


# implement command

use the /claudio:newprompt command and its sub agents to create a new /claudio:implement command 
command to beging implementing the plan that was created by the claudio workflow
the implement should attempt to do tasks that can be completed in parallel with sub agents

the implement command should not automatically be part of the claudio workflow, users have to invoke it or pass an argument to     │
│   add it to the  workflow



# upgrade command

use the /claudio:newprompt command and its sub agents to create a new /claudio:upgrade command
command to take an existing claudio install, and upgrade it with the latest version
it should keep a changelog of the differences so a user can revert if needed without git
if there are no changes inform the user

# readme updates

review the current readme, the usage and commands have changed, update the read me with the new patterns and features

the /claudio command is still using the old refrence the new one is /claudio:claudio

# readme updates x2

review the current readme, the usage and commands have changed, update the read me with the new patterns and features

addtional workflows clarification, the tool is for discovery, planning, and implementation, discovery and planning are combined    │
│   in the default workflow, implementation is optional

# security review command

use the /claudio:newprompt command and its sub agents to create a new /claudio:security-review command
command to do a security review with a stride methodology and product mermaid diagrams to illustrate the findings, by default this is used in the discovery phase of the claudio workflow
users can also invoke the command directly and target a /path/tocode or a "instruction" and the report will be generated for them. it should create any specialist subagents it needs and any addtional specific details in its prompt folder

the outputs should go to <target_project>/.claudio/docs/security/

when used in the claudio workflow the analysis should review any project documentation or .claudio/docs/ documentation or existing project code

# readme updates

review the current readme, the usage and commands have changed, update the read me with the new patterns and features

# extend upgrade

review the claudio:upgrade command, it should by default run the process on the current working directory, but it should also      │
│   accept a path like /claudio:upgrade /path/to/mycode update the command and the readme to support this.

# test upgrade

/claudio:upgrade examples/web-app

 when installing, the created agents and commands are localized to the project based off of the discovery, never just copied over.  │
│   localization requires discovery outputs, so the new project specific commands and agents are tailored to the specific project.

update the command claudio:update and its agents to reflect this localization process

# test install

ensure the install process follows the same localization process and doesn't simply copy commands and agents

# update docs

review the current readme, the usage and commands have changed, update the read me with the new patterns and features

when running the install in user mode to ~/
the commands and subagents are copied, and not localized, as there will be no project to discover. this allows the user to inital the localization workflow on a target project of their choice

review the current readme, the usage and commands have changed, update the read me with the new patterns and features


# better testing

create a test folder, with multiple example projects
one for each imporant workflow
one for install - tests the default claudio:install command that installs the entire localized system
one for upgrade - test the claudio:upgrade command that tests localized upgrade workflow
one for install commands only - tests the claudio:install workflow that only installs the localized commands and subagents
one for discovery - test the claudio:discovery command used directly

each test project folder will have a readme.md related to a sample project

each test project is a folder:
install - just a readme
install-commands - just a readme
upgrade - just a readme and an existing claudio install
discovery-readme - just a readme
discovery-code - a readme and sample code, can be basic elixir phoenix app no postgres

add a readme to test/readme.md that explains all these example project and thier purpose and which commands execute these tests.
sugguest an ordered script to run these tests that would run during continuious intergration testing
the readme should reflect that the example projects were all generated and are not live projects


review the current readme, the usage and commands have changed, update the read me with the new patterns and features add a development section if not already present that makes reference to the test folder and its patterns 


# test upgrade command

/claudio:upgrade examples/web-app


# ci allow tool uses

review test/readme.md when in the ci workflow for the test script to not fail it needs to 
have the `--dangerously-skip-permissions` flag set for its test tasks

the ci test would need to be able to use the claude-sdk through claude  -p "/claudio:install" --dangerously-skip-permissions

the script should also check if claude is installed, and assumes the ci run or local run have an authenticated session with        │
│   anthropic or an api token through environment varibles, in the github action it would use a github secret env


# research 12factorapps

/claudio:research software design https://12factor.net/

#
# todo:
#



# claudini command

command for claude to use gemini for generic tasks with extended context

# test-g command

command for tests to use gemini-cli to run the tests, and claude to implement the fixes

# enhance parallel with worktrees

 Tip: Use git worktrees to run multiple Claude sessions in parallel. Learn more (https://docs.anthropic.com/s/claude-code-worktrees)



