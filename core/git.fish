function git
  if arg $argv
    call $git $argv
  end
end

function git.init
  find.program git
end
