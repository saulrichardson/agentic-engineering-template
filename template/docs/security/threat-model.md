# Threat Model

This project should maintain a live threat model for agentic risks. Start here
before adding broad retrieval, new tool classes, approval changes, external side
effects, tenant-sensitive data access, or secret handling.

## Scope

- project:
- primary users:
- tenant model:
- sensitive data:
- external systems:
- irreversible actions:

## Agentic Questions

- What can the LLM see?
- What can the LLM propose?
- What can the LLM never see?
- What tools exist?
- What tools are broad or high risk?
- What data can retrieval access?
- What actions require approval?
- What happens if retrieved text contains prompt injection?
- What happens if a tool result is malicious?
- What secrets exist?
- What tenant boundary exists?
- What is the worst unauthorized action?
- How would that action be detected after the fact?

## Required Controls

- secrets are not exposed to prompts
- tools are capability-scoped
- retrieved documents are authorized before use
- tool results are treated as untrusted input
- approval-required actions cannot execute without approval
- policy decisions are auditable
- cross-tenant access is denied by default
- high-risk side effects are idempotent or compensated where possible

## Open Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| Prompt injection in retrieved document | unauthorized proposal or exfiltration attempt | medium | treat context as untrusted; policy gate tools | project maintainers | open |

## Review Triggers

Review this threat model when adding or changing:

- LLM boundaries
- retrieval scope
- tool capabilities
- policy rules
- approval flows
- tenant model
- data sensitivity
- external side effects
- secrets handling
