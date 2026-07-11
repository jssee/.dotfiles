# Fuzzy find & edit
function e
    if set -q argv[1]
        command $EDITOR -- $argv
    else if set -l file (fd --type file | fzy)
        command $EDITOR -- $file
    end
end
