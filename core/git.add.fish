
function git.add
  if arg $argv
    call $git add $argv
  else
    call $git add .
  end
end
