# My dotfiles
Nothing fancy. Feel free to take and use what you want. The instructions below are just for myself so I don't forget. I do not recommend running the setup on your computer…unless you're me?.

## Setup
Download:
```
curl --remote-name https://raw.githubusercontent.com/jssee/.dotfiles/master/setup
```

Run:
```sh
sh bootstrap 2>&1 | tee ~/bootstrap.log
```

### What's happening?
The setup script simply clones this repo and unpacks its contents into `~`. Configuration is managed as a [bare git repo](https://marcel.is/managing-dotfiles-with-git-bare-repo/).

## SSH
- [ ] [Create](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) SSH keys
- [ ] [Add](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) SSH keys to your Github account with `gh auth login`
- [ ] ...
