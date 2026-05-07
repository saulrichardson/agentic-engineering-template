# Threat Model

This project should maintain a live threat model for autonomous-agent,
runtime-agent, and high-risk software changes. Start here before adding broad
retrieval, new tool classes, approval changes, external side effects,
tenant-sensitive data access, secret handling, or broad coding-agent authority.

## Scope

- project:
- primary users:
- tenant model:
- sensitive data:
- external systems:
- irreversible actions:

## Development-Time Agent Questions

- What can coding agents read?
- What can coding agents write?
- What repository, cloud, database, or deployment credentials can they access?
- What commands, tools, or automation can they run?
- What changes require human review before merge or deployment?
- What generated code paths are high risk?
- What is the worst change a coding agent could make without detection?
- How would that change be caught before production?

## Runtime Agent Questions

Use these when the product contains LLMs, retrieval, planning, runtime agents,
or user-facing automation.

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
- coding-agent changes are reviewed according to risk before shipping
- deployment credentials are least privilege and not available to prompts

## Open Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| Prompt injection in retrieved document | unauthorized proposal or exfiltration attempt | medium | treat context as untrusted; policy gate tools | project maintainers | open |

## Review Triggers

Review this threat model when adding or changing:

- LLM boundaries
- coding-agent permissions
- retrieval scope
- tool capabilities
- policy rules
- approval flows
- tenant model
- data sensitivity
- external side effects
- secrets handling
