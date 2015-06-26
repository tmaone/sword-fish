function git.push
  if arg $argv
    call $git push $argv
  else
    call $git push origin
  end
end
