# IBM-Inspired Architectural Hooks for AI Apps

This reference defines the four critical "hooks" for building sophisticated, autonomous applications as inspired by IBM's technical documentation.

## 1. Input Hook (Triggers)
- **Definition**: The source that initiates an agent action.
- **Patterns**:
    - **User Query**: Natural language prompts from the UI.
    - **System Events**: File saves, build completions, or data updates.
    - **Scheduled Raids**: Time-based triggers for spaced repetition or automated audits.

## 2. Orchestration Hook (The Brain)
- **Definition**: The logic that manages task breakdown and routing.
- **Patterns**:
    - **Dynamic Workflow**: LLM-driven step generation (best for complex research).
    - **Deterministic Workflow**: Pre-defined logic paths (best for consistent study drills like Dictation).
    - **Hierarchical Routing**: Main orchestrator dispatching tasks to specialist agents (e.g., Video Engine vs. AI Sensei).

## 3. Tool/Action Hook (The Muscles)
- **Definition**: The mechanism for interacting with the external world.
- **Patterns**:
    - **MCP (Model Context Protocol)**: Universal bridge to DBs, APIs, and Files.
    - **Browser APIs**: Web Speech API for voice, HTML5 Video API for playback.
    - **Shell Execution**: Running build commands or tests.

## 4. Reflection Hook (The Self-Correction)
- **Definition**: A feedback loop where the agent evaluates its own output or tool results.
- **Patterns**:
    - **Verification Loop**: "Did the video stutter?" -> If yes, refactor playback logic.
    - **Cognitive Integrity**: "Did the user actually understand the particle 'ga'?" -> If no, re-trigger explanation.
    - **Prompt Refinement**: Adjusting instructions based on the quality of retrieved knowledge.
