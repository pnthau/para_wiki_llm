---
domain: IT_Knowledge
type: reference
status: active
tags: [mcp, adk, agent, architecture, automation, llm]
created: 2026-05-30
source: 00_Raw/MCP and ADK.md
nexus_version: 6.0
---

# MCP & ADK: The Future of Agent Architecture

**Summary**: MCP (Model Context Protocol) standardizes external connectivity while ADK (Agent Development Kit) provides the structural framework for agent logic and multi-agent orchestration. Together, they form the "Nervous System" and "Brain" of modern AI Agents.

---

| Cue | Notes |
| :--- | :--- |
| **What is MCP?** | **Model Context Protocol (by Anthropic)**: An open standard to solve the "connectivity problem".<br>Eliminates custom integration code for DBs, Web, and Files.<br>Uses JSON RPC (Standard I/O or HTTP with streaming). |
| **MCP Primitives** | 1. **Tools**: Callable functions (SQL queries, web search).<br>2. **Resources**: Readable data (Files, docs, DBs).<br>3. **Prompts**: Pre-built command templates. |
| **Model Agnostic?** | Yes. Works with Claude, GPT, Gemini, etc., as long as they "speak" MCP. |
| **What is ADK?** | **Agent Development Kit (by Google)**: An open-source Python framework for building and structuring agents.<br>Treats agent building like professional software engineering. |
| **ADK Core Blocks** | **Agents, Tools, Memory, Events, Runners**.<br>Supports both flexible LLM-driven reasoning and deterministic workflows (sequential/parallel loops). |
| **Safety & Control** | ADK's **Runner** system allows yielding control before tool execution, making debugging and safety guards (e.g., preventing accidental DB deletion) easier. |
| **Synergy** | **ADK decides what the agent should do** (Brain/Logic).<br>**MCP defines how it executes** via external world communication (Nerves/Interface). |

---

## 🚀 Self-Upgrade: Gemini Nexus x MCP/ADK

Dựa trên nội dung này, tôi có thể tự nâng cấp bản thân theo các hướng sau:

1. **Chuẩn hóa Kết nối (MCP Integration)**:
   - Thay vì viết code tích hợp thủ công cho từng dự án, tôi có thể tích hợp **MCP Servers**.
   - Giúp tôi truy cập GitHub, Jira, SQL DB của John một cách chuẩn hóa, an toàn và nhanh chóng hơn.

2. **Cấu trúc hóa Logic (ADK Framework)**:
   - Áp dụng mô hình **Runner - Event** để quản lý trạng thái các "Trận tập kích" (Raid).
   - Tăng cường khả năng tự gỡ lỗi (Self-debugging) bằng cách "yield" trạng thái trước khi thực thi các lệnh shell nguy hiểm.

3. **Điều phối Đa tác nhân (Multi-Agent Orchestration)**:
   - Sử dụng mô hình **Orchestrator** của ADK để quản lý các Sub-agents hiệu quả hơn.
   - Phân rã nhiệm vụ (Task Decomposition) một cách xác định hơn trước khi giao việc cho `codebase_investigator` hay `java-reviewer`.

---

## Related
- [[Multi_Agent_AI_Systems]]
- [[AI_Agent_Memory_Architecture_CoALA]]
- [[Gemini_CLI_Memory_System]]
