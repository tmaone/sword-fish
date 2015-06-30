function syno --description 'Evaluates the command if the current Operating System is Synology'

  if test (os) = "syno"
    if arg $argv
      eval $argv
    end
    return 0
  else
    return 1
  end

end
