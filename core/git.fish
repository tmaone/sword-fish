function git
  if arg $argv
    call $git $argv
  end
end

function git.isgit

end

function git.url
  if arg $argv
    if test -d "$argv/.git"
      wd.save
      cd "$argv"
      call $git config --get remote.origin.url
      cd (wd.get)
    end
  else
    call $git config --get remote.origin.url
  end
  # git ls-remote --get-url
# git config --get remote.origin.url
end

function git.init
  find.program git
end
