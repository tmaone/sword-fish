function appm.help
  out.ln "MacOS X Applications Package Manager"
  out.ln ""
	out.ln "Usage: appm [ command ] [ application ]"
  out.ln ""
  out.ln "Available commands"
  out.ln ""
  out.ln "  list           "
  out.ln "  listex         "
  out.ln "  listinst       "
  out.ln "  archive   [app]"
  out.ln "  exclude   [app]"
  out.ln "  info      [app]"
  out.ln "  backup    [app]"
  out.ln "  install   [app]"
  out.ln "  uninstall [app]"
  out.ln "  help           "
end

function appm.exclude
  if arg $argv
   echo $argv
  else
    echo $appm_exlude
  end
end

function appm
  if arg $argv
    switch "$argv[1]"
      case list
      case installed
      case lista
      case archive
      case search
      case exclude
      case info
      case backup
      case install
      case uninstall
      case source
      case update
      case help
        appm.help
      case test
      case '*'
        error "Not valid command."
        appm.help
    end
  else
    appm.help
  end
end
