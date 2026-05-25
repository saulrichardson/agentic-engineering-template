# Documentation

This directory contains project-local context for `<project name>`.

`../AGENTS.md` is the operating guide for autonomous coding agents. The files
here explain what the product should accomplish, how the project works today,
and what durable decisions future agents should inherit.

## Read Order

1. `../AGENTS.md`
2. `approach.md`
3. `product-intent.md`
4. `records/README.md`
5. Relevant project records in `records/`

## Operating Model

Use `approach.md` for current project truth: what the project is, who it serves,
the selected stack, the current architecture, ownership boundaries, constraints,
invariants, verification expectations, and delivery approach.

Use `product-intent.md` for the product north star: the user goals, desired
outcomes, workflows, examples, and open questions that explain what the product
is supposed to accomplish. Coding agents should update it as they better
understand what the user wants.

Use `records/` for durable project memory: why a decision was made, what caveat
matters, what tradeoff was accepted, what lesson was learned, and what future
agents should remember.

## Practical Rule

- Current truth or operating model: `approach.md`
- Product goal or user intent: `product-intent.md`
- Rationale, history, caveats, or lessons: `records/`
- Agent behavior and working rules: `../AGENTS.md`
