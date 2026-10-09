---
name: dotfiles
description: Work on Jesse's dotfiles — configs in ~/.config, scripts in ~/.local/bin, the Brewfile, and macOS setup — tracked in the bare repo at ~/.dotfiles. Read before editing, committing, or auditing anything in $HOME.
---

# Dotfiles

`~/.dotfiles` is a bare git repo whose work tree is `$HOME`. `$HOME` itself is not a repo, so plain `git` there fails. Use `dots` from any directory; it is git with the dotfiles repo wired in, run from `~` so paths are always relative to `~`. With no arguments it shows the branch, changed files, and untracked files beside tracked ones.

Run `make -C ~ check` after each edit. It prints `OK|WARN|ERROR` lines like `:checkhealth`: ERROR means a config or script is broken (exit 1); WARN is drift Jesse may intend, such as a package that is installed but not in the Brewfile.

## Gotchas

- `diff.external` is difftastic. Pass `--no-ext-diff` to `dots diff`, `dots show`, and `dots log -p` to get a patch.
- `status.showUntrackedFiles` is off. A new file is invisible to `dots status`; run `dots` to see it, then `dots add` it or add an anchored pattern to `~/.gitignore` if a tool owns it.
- `~/.config/nvim` is a submodule (github.com/jssee/nvim). Commit inside it with `git -C ~/.config/nvim`, push it, then record the new pointer with `dots add .config/nvim` as `chore: update nvim`.
- Tools append machine-specific lines to tracked files (e.g. amp's credential helper in `.config/git/config`). Leave them uncommitted; stage around them.
- A work and a personal machine both push here. `dots fetch` and rebase before pushing.

## Where things live

| What | Path |
|---|---|
| Packages | `~/.homebrew/Brewfile` (`make brew`) |
| macOS defaults | `~/.local/bin/setup_macos` (`make macos`) |
| New machine | `~/.local/bin/bootstrap`, then `make` |
| Tool-owned ignores | `~/.gitignore` (dotfiles repo only) |
| Global git ignores | `~/.config/git/ignore` (every repo) |

Commits use `<label>: <summary>` with `feat`, `fix`, `ref`, or `chore`.
