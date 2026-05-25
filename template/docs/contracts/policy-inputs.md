# Policy Input Contracts

Use this file for permission and authority decisions that matter across the
system.

Policy can live in application code, a policy module, a rules engine, database
constraints, or a service boundary. The important part is that inputs and
decisions are visible and testable.

## Authority Dimensions

Record the dimensions this project uses:

- actor identity
- role or membership
- tenant or ownership boundary
- resource classification
- action
- environment
- feature flag or rollout state
- approval or coordination state

## Policy Registry

| Decision | Inputs | Allow result | Deny result | Audit event |
| --- | --- | --- | --- | --- |
| `can_invite_team_member` | actor, team, target email, role | invitation command allowed | denied with reason | `team_invite_policy_checked` |
| `can_export_report` | actor, tenant, report type, data class | export allowed | denied with reason | `report_export_policy_checked` |

## Core Fields

For each policy decision, record:

- decision name
- inputs
- allow result
- deny result
- audit or trace event
- tests or examples

## Guidance

Permission decisions should be easy to call from every entry point that needs
them. Tests should include representative allow and deny cases.
