# Product Intent

This file communicates what the product is trying to become.

Use it as the north star for user goals, desired outcomes, important workflows,
examples, and open questions. Coding agents should update it as they learn what
the user wants.

Keep this file focused on product direction and user intent. Put technical
architecture in `approach.md` and durable rationale in `records/`.

## North Star

What should this product ultimately help users or developers accomplish?

## Intended Product Shape

What kind of thing is this product trying to become?

Examples:

- application
- internal tool
- developer platform
- data product
- automation system
- workflow engine
- operating environment
- analysis system
- customer-facing experience
- infrastructure layer
- research prototype

What familiar smaller pattern should it not be reduced into?

## Who It Serves

Who uses this system, and what job are they trying to get done?

## Desired Outcomes

What should become possible for users, developers, operators, or the system itself?

Describe outcomes as completed units of value, not just artifacts.

Prefer outcomes like:

- diagnose a problem and complete the fix
- create, test, and launch an intervention
- answer a business question with evidence and a decision
- detect a production issue and verify recovery
- convert raw data into a monitored operational change

over artifacts like:

- generate a summary
- show a chart
- create a ticket
- call an API
- display a recommendation

Project outcomes:

- <outcome>

## Core Workflows

What are the most important end-to-end workflows?

For each workflow, describe the full path from intent to completed value:

```text
intent
  -> context gathered
  -> work performed
  -> result verified
  -> output delivered or action taken
  -> durable state or learning preserved
```

If the current prototype cannot complete the full path, state which boundary is simulated or deferred.

## Product Qualities

What should the product feel like to use?

What should be fast, obvious, powerful, precise, forgiving, or trustworthy?

## Examples

Representative examples, scenarios, sample inputs, sample outputs, or sketches:

- <example>

## Open Questions

- <question>

## When To Update This File

Update this file when the user clarifies the goal, a workflow becomes important,
an implementation reveals a product question, or the product direction changes.
