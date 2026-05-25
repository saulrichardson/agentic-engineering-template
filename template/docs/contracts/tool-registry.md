# Integration And Side-Effect Capability Catalog

Use this catalog for shared integrations or side-effect capabilities.

A capability is any reusable way to mutate the world or depend on an external
system: email, payment, file write, external API, command execution, queue
publish, notification, cloud mutation, or data export.

## Registry

| Capability | Purpose | Input | Output | Owner | Side effect | Idempotency | Timeout | Observable event | Failure states |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `sendInvitationEmail` | Notify an invited user | `InvitationEmailInput` | delivery result | notifications worker | email send | invitation id | 10s | `invitation_email_sent` | failed, bounced |
| `syncCustomerRecord` | Update CRM copy of customer data | `CustomerSyncInput` | sync result | integrations worker | external API write | customer id + version | 30s | `customer_sync_completed` | failed, skipped |

## Core Capability Fields

For each capability, define:

- purpose
- typed or documented input
- output or result state
- owner
- permission or policy expectation
- side effect
- idempotency behavior
- timeout
- observable event
- failure states

## Capability Guidance

Shared capabilities should be narrow enough to reason about and broad enough to
replace repeated one-off integrations. When a capability is high impact, pair it
with tests, operational notes, and a threat-model entry.
