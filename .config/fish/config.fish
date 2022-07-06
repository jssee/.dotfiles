set fish_greeting

set -gx EDITOR nvim

alias l "ls -laG"
alias dg "$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias cleanup "fd -t file -H -g \"*DS_Store\" -x rm"

if status is-interactive
    # source asdf
    if test -d $HOME/.asdf
        source ~/.asdf/asdf.fish
        # manually add completions
        # ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
    end

    # ensure fisher and plugins are installed
    if not test -f $HOME/.config/fish/functions/fisher.fish
        echo "🎣 installing fisher..."
        curl -sLo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
        fisher
    end

    if type -q hub
        eval (hub alias -s)
    end

    if type -q direnv
        direnv hook fish | source
    end

    set hydro_color_git magenta
    set hydro_color_duration yellow
    set hydro_symbol_git_dirty ✦
end
