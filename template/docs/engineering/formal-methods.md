# Deep Verification

Use deep verification when ordinary tests leave important uncertainty.

This file covers property tests, model-based tests, state-machine tests,
lightweight specs, model checking, and proof-oriented tools. The project can use
any technique that clarifies the invariant and gives future agents better
feedback.

## When To Reach For It

Deep verification is useful for:

- money movement
- authorization and ownership
- concurrency
- idempotency
- migrations that preserve invariants
- workflow retries and compensation
- scheduling
- distributed state
- data transformations with subtle edge cases

## Useful Techniques

- table-driven tests for known cases
- property tests for broad input spaces
- state-machine tests for lifecycle behavior
- model-based tests for implementation/spec agreement
- lightweight written specs for algorithms or protocols
- TLA+, Alloy, or similar model checking for concurrent workflows
- Dafny, Lean, Coq, or similar tools for proof-worthy invariants

Choose the smallest technique that makes the risk easier to reason about.

## How To Document A Deep Check

Record:

- invariant being protected
- model or property being tested
- command to run it
- relationship between the model and production code
- known limits of the check
- owner for keeping it useful

Place durable notes in the relevant contract, feature brief, or ADR.
