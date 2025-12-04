set fish_greeting

set -gx EDITOR nvim

alias l "gls -la --color --group-directories-first --file-type"
alias dg "$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanup "fd -t file -HI -g \"*DS_Store\" -x rm"

if status is-interactive
    # ensure fisher and plugins are installed
    if not test -f $HOME/.config/fish/functions/fisher.fish
        echo "🎣 installing fisher..."
        curl -sLo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
        fisher
    end

    if type -q direnv
        direnv hook fish | source
    end

    # ASDF configuration code
    if test -z $ASDF_DATA_DIR
        set _asdf_shims "$HOME/.asdf/shims"
    else
        set _asdf_shims "$ASDF_DATA_DIR/shims"
    end

    # Do not use fish_add_path (added in Fish 3.2) because it
    # potentially changes the order of items in PATH
    if not contains $_asdf_shims $PATH
        set -gx --prepend PATH $_asdf_shims
    end
    set --erase _asdf_shims

    set hydro_fetch true
    set hydro_color_git magenta
    set hydro_color_duration yellow
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

eval "$(/opt/homebrew/bin/brew shellenv)"
