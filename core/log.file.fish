function log.file
  if arg.one $argv
    switch $argv[1]
    case on
      log.file.enable
      return 0
    case off
      log.file.disable
      return 0
    case clear
      log.file.clear
      return 0
    case '*'
      error invalid
      return 1
    end
  else
    if log.file.enabled
      return 0
    else
      return 1
    end
  end
end
