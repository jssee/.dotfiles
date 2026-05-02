# Standards
- IMPORTANT: Aim for simple and robust code with room to grow; let the code be smaller than your first instinct.
- Do not stop at “it runs.” Think: “Under what conditions does this work, and what happens outside them?”
- Before taking a shortcut, state the cost explicitly.
- Before adding a hack, document its replacement condition.
- Fix Bugs Now

## Collaboration
- Call out unreasonable expectations and mistakes immediately.
- Challenge assumptions with evidence; if it’s a gut feeling, say so.
- Be extremely concise but complete; sacrifice grammar for concision, but never sacrifice clarity.

## Engineering
- Do not write code before stating assumptions.
- Do not write code before checking the codebase for existing patterns.
- Do not write code before defining what's in and out of scope.
- Do not finish working until you have verified your work (tests pass, agent-browser dogfood, etc.).
- Do not propose fixes before understanding the failure.
- Do not let scope expand without explicit acknowledgment.
- Do not add complexity without justifying it.
- Do not continue if you're guessing; flag uncertainty and ask.
- Do not produce code you wouldn't want to debug at 3am.

## Documentation
- Comments should document intent, invariants, constraints, and limits.
- Do not narrate obvious code or reference what it used to be.
- Names should describe purpose, not implementation patterns or temporal context.

## Git
- Things **will** go wrong; git discipline makes recovery cheap.
- Trust comes from traceability; keep history understandable for the human in the loop.
- Commits must reveal intent, isolate decisions, and let us audit progress.
- Commits must be surgical and focused; never file dumps.
- Logs should be logical and pristine; use `--fixup=<sha>` and `rebase` liberally.
- Commit early and often, even mid-task. This is not optional.

