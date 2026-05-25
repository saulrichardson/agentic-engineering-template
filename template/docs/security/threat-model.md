# Threat Model

This project should maintain a live threat model for sensitive data, credentials,
deployment access, external systems, destructive operations, tenant boundaries,
and high-impact coding-agent work.

Use this file as a working document. Keep it practical and specific to the
project.

## Scope

- project:
- primary users:
- tenant model:
- sensitive data:
- external systems:
- irreversible actions:
- deployment targets:

## Coding-Agent Access Questions

- What can coding agents read?
- What can coding agents write?
- What repository, cloud, database, or deployment credentials can they access?
- What commands, tools, or automation can they run?
- What changes deserve human review before merge or deployment?
- What generated code paths are high impact?
- What signal would reveal a harmful change before users feel it?

## Product And Operations Questions

- What data requires special handling?
- What external systems can the product touch?
- What actions have financial, legal, privacy, or trust impact?
- What actions should be auditable?
- What tenant or ownership boundaries exist?
- What operational credentials exist?
- What deployment path can affect production?
- What rollback or mitigation path exists for high-impact changes?

## Core Controls

- secrets are stored in approved secret managers or environment systems
- credentials use least privilege
- high-impact actions have clear owners
- sensitive data is excluded from casual logs and screenshots
- cross-tenant access is denied by default in policy or data design
- migrations and destructive operations have backups or mitigation plans
- production changes leave deployment evidence
- security-sensitive behavior has tests or review evidence

## Open Threats

| Threat | Impact | Likelihood | Control | Owner | Status |
| --- | --- | --- | --- | --- | --- |
| Unauthorized data export | privacy breach | medium | policy check, audit event, least privilege credentials | project maintainers | open |

## Review Triggers

Review this threat model when adding or changing:

- authentication or authorization
- tenant ownership
- sensitive data storage
- external integrations
- payment or financial actions
- deployment credentials
- destructive commands
- migrations touching important data
- broad coding-agent permissions
