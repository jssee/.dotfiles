function g --wraps git --argument-names cmd
    switch $cmd
        case ""
            git status --short --branch
        case \*
            git $cmd
    end
end
