# Threat Model: <scope>

- status: draft
- owner:
- date: YYYY-MM-DD

## Scope

- feature or system:
- users:
- tenant boundary:
- sensitive data:
- external systems:
- side effects:

## LLM Exposure

- what can the LLM see?
- what can the LLM propose?
- what is never sent to the LLM?
- what output schemas are allowed?

## Retrieval

- data sources:
- authorization rule:
- sensitive labels:
- prompt-injection handling:
- source traceability:

## Tools

| Tool | Capability | Side effect | Approval | Policy rule | Audit event |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Threats

| Threat | Impact | Likelihood | Control | Detection | Residual risk |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Worst Unauthorized Action

Describe the worst plausible unauthorized action and how the system prevents,
detects, and mitigates it.

## Required Tests

- denial path:
- malformed LLM output:
- prompt injection:
- unauthorized retrieval:
- approval required:
- idempotency or compensation:
