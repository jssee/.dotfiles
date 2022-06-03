function g --wraps git
    switch $argv
        case ""
            git status --short --branch
        case \*
            git $argv
    end
end
