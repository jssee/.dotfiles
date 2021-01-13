if [[ -d "$HOME/.zplug" ]]; then
	source $HOME/.zplug/init.zsh

	zplug zplug/zplug, hook-build:'zplug --self-manage'
	zplug rupa/z, use:z.sh
	zplug mafredri/zsh-async, use:async.zsh
	zplug sindresorhus/pure, use:pure.zsh, as:theme
	zplug zsh-users/zsh-syntax-highlighting, defer:2
	zplug zsh-users/zsh-completions, defer:3
	zplug g-plane/zsh-yarn-autocompletions, hook-build:'./zplug.zsh', defer:2

	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
	fi

	zplug load

else
	echo "zplug not installed: https://github.com/zplug/zplug#installation"
fi

# options
setopt nocaseglob
setopt autocd
setopt autolist
setopt automenu
setopt alwaystoend
setopt sharehistory
setopt appendhistory
setopt histignoredups
setopt histreduceblanks

# aliases
alias l='ls -laG'
alias c='clear'
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias map="xargs -n1"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanup="fd -t file -H -g \"*DS_store\" -x rm"
# special `git` command for dotfiles
alias dg="$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# functions
FPATH="$HOME/.zsh/functions:$FPATH"
autoload cx
autoload g
autoload mkd

if [[ -d "$HOME/.asdf" ]]; then
	source $HOME/.asdf/asdf.sh
	FPATH="$ASDF_DIR/completions:$FPATH"
fi

autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+20) ]]; then
	compinit -d $HOME/.zcompdump
else
	compinit -d $HOME/.zcompdump -C
fi

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
	'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
