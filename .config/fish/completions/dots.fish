# dots runs git from ~, so completions must resolve paths there too. Git's own
# completions fall back to plain file completion, which only follows the
# current directory, so run them from ~ in a fish with no config: without the
# config, the cd fires no hooks such as z or direnv.
complete -c dots -f -a '(__dots_complete)'
complete -c dots -n __fish_use_subcommand -a edit -d 'Edit a tracked file'

function __dots_complete
    set -l before (string escape -- (commandline -xpc)[2..-1])
    fish --no-config -c '
        cd ~
        # Load git completions, then drop untracked files from them: ~ holds
        # hundreds of thousands, and listing them takes seconds. New files
        # still complete as plain paths.
        complete -C "git " >/dev/null
        functions -c __fish_git_files __fish_git_files_all
        function __fish_git_files
            __fish_git_files_all (string match -v untracked -- $argv)
        end
        complete -C "git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv"
    ' -- (string join ' ' -- $before (commandline -ct))
end
