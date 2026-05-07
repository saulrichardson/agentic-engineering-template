# Formal Methods Guidance

Formal methods are not ceremony. They are a tool for making high-risk invariants
harder to misunderstand.

Use them where the cost of ambiguity is high:

- permission lattices
- workflow state machines
- approval invariants
- quota or accounting logic
- ledger or payment invariants
- retry and idempotency behavior
- concurrent tool execution
- document access guarantees

## Default Use

Start with ordinary typed domain code and tests. Add formal methods when a rule
is important enough that examples are not convincing.

Recommended roles:

- Dafny for implementation-adjacent verified modules
- TLA+ for distributed workflow, retry, approval, and concurrency models
- Lean only when proof depth is justified by the domain

## Good Candidate Questions

- Can this action ever execute without required approval?
- Can duplicate callbacks produce duplicate side effects?
- Can a denied policy path still reach a tool gateway?
- Can a workflow finish in an impossible state?
- Can concurrent events violate ownership or quota?

## Documentation Rule

If formal methods are introduced, add an ADR that explains:

- the invariant being protected
- why ordinary tests are not enough
- where the spec lives
- how the spec is checked
- what implementation code is covered by the spec
