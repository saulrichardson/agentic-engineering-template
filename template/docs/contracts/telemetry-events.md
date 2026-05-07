# Telemetry And Audit Event Contracts

Telemetry should make important behavior reconstructable without leaking secrets
or private data.

## Correlation IDs

Carry these IDs when relevant:

- request id
- user id
- tenant id
- agent run id
- workflow id
- LLM call id
- tool proposal id
- tool invocation id
- approval id
- state transition id
- audit event id

## Event Registry

| Event | Type | Required fields | Sensitive fields excluded | Purpose |
| --- | --- | --- | --- | --- |
| `user_intent_received` | audit | user id, tenant id, intent id | raw secrets | record user request |
| `llm_call_completed` | trace | model, call id, output variant | prompt secrets | reconstruct model boundary |
| `policy_decision_recorded` | audit | decision, actor, resource, result | secret values | explain allow/deny |
| `tool_invocation_recorded` | audit | tool, invocation id, result | raw credentials | reconstruct side effect |
| `state_transition_applied` | audit | object id, from, to, event | private payloads | explain lifecycle |

## Rules

- log structured facts, not prompt dumps by default
- never log secrets
- redact sensitive content intentionally
- audit high-risk state changes and side effects
- traces should connect user intent, LLM calls, policy, tools, workflows, and persistence
