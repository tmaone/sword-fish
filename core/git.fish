function git
  if arg $argv
    call $git $argv
  end
end

function git.isgit
  if arg.one $argv
    if test -d $argv[1]/.git
      return 0
    else
      return 1
    end
  end
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

function git.add
  if arg $argv
    call $git add $argv
  else
    call $git add .
  end
end

function git.commit
  if arg $argv
    call $git commit -a -m "$argv"
  else
    call $git commit -a -v --reuse-message=HEAD
  end
end

function git.init
  find.program git
end

function git.status
  call $git status
end

# function git.url
