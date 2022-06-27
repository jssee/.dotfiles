function g --wraps git --argument-names cmd
    switch $cmd
        case ""
            git status --short --branch
        case \*
            git $argv[1..-1]
    end
end
