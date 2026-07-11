function mkd --wraps mkdir --argument-names directory
    mkdir -p -- $directory && cd -- $directory
end
