# My dotfiles
Nothing fancy. Feel free to take and use what you want. The instructions below are just for myself so I don't forget. I do not recommend running the setup on your computer…unless you're me?.

## Setup
One-liner clone for new machines:
```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/jssee/.dotfiles/main/.local/bin/bootstrap)"
```

The bootstrap script lives at `.local/bin/bootstrap`. It clones this repo into `$HOME/.dotfiles`, syncs the worktree into `$HOME`, backs up overwritten files with a `.dotfiles.bak` suffix, and initializes submodules. Machine setup still happens separately with `make`.

Configuration is managed as a [bare git repo](https://marcel.is/managing-dotfiles-with-git-bare-repo/).

## SSH
- [ ] [Create](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) SSH keys
- [ ] [Add](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) SSH keys to your Github account with `gh auth login`
- [ ] ...
