# Agentic Engineering Starter Pack

This repository is a copyable documentation starter pack for software projects
built with autonomous coding agents.

It is intentionally simple. There is no project generator, template engine, or
single-file review artifact. The useful thing is the starter documentation under
`starter/`.

## What This Provides

The starter gives a new or existing project four durable surfaces:

- `AGENTS.md`: how coding agents should work in the repository.
- `docs/product-intent.md`: what the product is trying to accomplish.
- `docs/approach.md`: the current stack, architecture, operating model,
  constraints, verification path, and delivery model.
- `docs/records/`: durable rationale, dated decisions, caveats, tradeoffs, and
  lessons future agents should inherit.

The core model is:

```text
AGENTS.md = agent behavior
docs/product-intent.md = product north star
docs/approach.md = current project truth
docs/records/ = durable project memory
```

## Use In A Project

Copy the starter files into a project:

```bash
cp -R starter/. /path/to/project/
```

Then edit the placeholders in:

```text
AGENTS.md
README.md
docs/product-intent.md
docs/approach.md
```

If the target project already has a `README.md`, merge the useful operating
model section from `starter/README.md` instead of replacing the existing README.

## Starter Layout

```text
starter/
  AGENTS.md
  README.md
  docs/
    README.md
    approach.md
    product-intent.md
    records/
      README.md
```

## How The Docs Work

Use `AGENTS.md` to define how coding agents interpret goals, make decisions,
verify work, and report outcomes.

Use `docs/product-intent.md` to keep the product goal visible. It should explain
what the product should accomplish for users or developers. Coding agents should
update it as they learn what the user wants.

Use `docs/approach.md` to keep the current product and technical operating model
accurate. This is where agents document the current stack, architecture,
constraints, verification path, and delivery model.

Use `docs/records/` when future agents need durable reasoning: why a choice was
made, what caveat matters, what tradeoff was accepted, or what lesson should
change future work.

## Maintainer Notes

Keep the pack small. Add guidance only when it helps coding agents make better
project decisions across many repositories.

Prefer improving the four core surfaces over adding new documentation
categories. The goal is a starter that can be copied into a project and quickly
made local.
