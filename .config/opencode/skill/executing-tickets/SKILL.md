---
name: executing-tickets
description: Use to implement tickets created by writing-tickets skill
---

# Executing Tickets

## Overview

Work through tickets from `tk ready`, implementing each one following TDD. Each ticket is a self-contained unit of work with all context needed.

**Announce at start:** "I'm using the executing-tickets skill to implement tickets."

**Context:** Run in the worktree where tickets were created.

## Workflow

### 1. Get Next Ticket

```bash
tk ready
```

Pick the highest priority ticket (or ask user if multiple options).

### 2. Start Work

```bash
tk start <id>
tk show <id>
```

Read the ticket thoroughly. Understand:
- Files to create/modify
- Steps to follow
- Acceptance criteria

### 3. Execute Steps

Follow the ticket's steps exactly. Typical TDD flow:

1. **Write failing test** - Copy test code from ticket
2. **Run test** - Verify it fails as expected
3. **Implement** - Write minimal code to pass
4. **Run test** - Verify it passes
5. **Commit** - Use commit message from ticket or derive from task

### 4. Verify Acceptance Criteria

Before closing, check every acceptance criterion:
- [ ] All tests pass
- [ ] Code follows project patterns
- [ ] No regressions (run full test suite if ticket impacts shared code)

### 5. Close Ticket

```bash
tk close <id>
```

Add notes if needed:

```bash
tk add-note <id> "Deviated from plan: used X instead of Y because..."
tk add-note <id> "Found issue: created follow-up ticket for Z"
```

### 6. Repeat

```bash
tk ready
```

Continue until no tickets ready or user stops.

## Handling Blockers

If stuck on a ticket:

```bash
# Check what's blocking
tk blocked

# If missing dependency, work on blocker first
tk show <blocker-id>

# If unclear requirements, ask user
# If bug in plan, add note and ask user
tk add-note <id> "Blocked: [reason]"
```

## Creating Follow-up Tickets

If you discover additional work needed:

```bash
tk create "Fix edge case discovered in X" --type=bug --priority=1
tk dep <new-id> <current-epic-id>
tk add-note <current-id> "Created follow-up: <new-id>"
```

## Code Review Checkpoints

After each ticket:

1. Review diff: `git diff HEAD~1`
2. Run linter/formatter
3. Run relevant tests
4. Sanity check: does this actually solve the ticket?

If issues found, fix before moving to next ticket.

## Commands Reference

```bash
tk ready                 # next workable tickets
tk start <id>            # mark in_progress
tk show <id>             # view ticket details
tk close <id>            # mark done
tk add-note <id> "..."   # append note
tk blocked               # view blocked tickets
tk dep tree <epic-id>    # see overall progress
tk ls --status=in_progress  # what's currently active
```

## Remember

- One ticket at a time
- Follow steps exactly (they contain tested code)
- Commit after each ticket
- Don't skip acceptance criteria
- Add notes for deviations or discoveries
- Ask user if unclear, don't guess
