# Starter Maintainer Guide

This repository maintains a copyable documentation starter pack for projects
worked on by autonomous coding agents.

The starter files live under `starter/`. Files outside `starter/` maintain this
repository and are not part of the pack copied into projects.

## Core Guidance

Preserve this guidance across starter changes:

```text
Autonomous coding agents are collaborators with initiative.
They inspect, decide, implement, test, document, and prepare delivery.
Their work leaves evidence: clear intent, coherent changes, useful checks,
deployment context, and decisions that future agents can understand.
```

Keep the repository focused on portable documentation. Add framework code,
generators, or scripts only when they clearly improve the starter-pack workflow.

## Maintainer Rules

- Keep `starter/` portable across product domains.
- Keep `starter/AGENTS.md` strong enough to guide coding agents and short enough
  that future agents read it.
- Put product north star, user goals, desired outcomes, workflows, and examples
  in `starter/docs/product-intent.md`.
- Put current project truth, stack, architecture, constraints, and delivery
  approach in `starter/docs/approach.md`.
- Put durable decisions, caveats, stack rationale, risks, operating notes,
  security assumptions, feature context, and lessons learned in
  `starter/docs/records/`.
- Add new documentation categories only when they remove real ambiguity.

## Verification

After editing the starter, inspect the file list and scan for template-engine
markers or stale generator language:

```bash
find starter -maxdepth 4 -type f | sort
rg -n '\{\{|\}\}|[Cc]opier|AGENTIC[_]ENGINEERING[_]DOCTRINE' starter README.md
```
