function git.commit
  if arg $argv
    call $git commit -a -m "$argv"
  else
    call $git commit -a -v --reuse-message=HEAD
  end
end
