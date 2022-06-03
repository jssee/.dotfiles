# Fuzzy find & edit
function e
  if test (count $argv) -gt 0
    command $EDITOR $argv
  else
    fd -t f | fzy | xargs $EDITOR
  end
end
