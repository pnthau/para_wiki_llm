---
domain: IT_Knowledge
type: atomic-note
status: active
tags: [ai, multi-agent, architecture, nasa, strategy]
created: 2026-05-28
source: 00_Raw/hệ thống AI Đa tác nhân (Multi-Agent).md
nexus_version: 6.0
---

# Multi AI Agent Systems: From Confidence to Verification

## Cornell Notes

| Cue | Notes |
| :--- | :--- |
| **The Single Agent Trap** | - **Ignorance Blindness**: AI doesn't know what it doesn't know.<br>- **Confident Hallucination**: LLMs are designed for plausibility, not truth boundaries.<br>- **Missing Skepticism**: No built-in uncertainty measurement. |
| **Human Verification Models** | - **Medical**: Second opinions / Tumor boards.<br>- **Finance**: "Four-eyes principle" (dual authorization).<br>- **Aviation**: Pilot/Co-pilot + Checklists.<br>- **Axiom**: Trust comes from verification, not confidence. |
| **NASA Case Study (Apollo 11)** | - **Architecture**: Specialized roles (GUIDO, FIDO, EECOM, CAPCOM) led by Flight Director.<br>- **Go/No-go Protocol**: Unanimous consensus required for critical steps.<br>- **Conflict Resolution**: Error 1202 incident showed how distributed expertise prevents panic and ensures mission success. |
| **Multi-Agent Architecture** | 1. **Generator Agent**: Fast thinking, creative drafting.<br>2. **Verifier Agent**: Cross-checks facts, catches hallucinations.<br>3. **Adversary Agent (Red Team)**: Tries to break the system, identifies blind spots.<br>- **Goal**: "Earned Confidence" through dialectic tension. |
| **Implementation Strategy** | - **Low Risk**: Single Agent (Email summaries, entertainment).<br>- **High Stakes**: Multi-Agent (Medical, Legal, Finance, Safety-critical operations). |

## Summary
Multi-agent systems move AI from "blind trust" to "earned confidence" by mimicking robust human structures like NASA Mission Control. By separating creation (Generator), verification (Verifier), and skepticism (Adversary), systems can catch errors that a single "brain" would miss, making AI safe for high-stakes domains.

## Related
- [[MOC_IT_Knowledge]]
- [[MOC_Strategy]]
- [[Java_3_Layer_Architecture]] (Design pattern comparison)
- [[Collective_Intelligence]]
- [[AI_CORAL_Architecture]] (Self-Evolving Architecture)
