function appm.help
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
    out $argv
  else
    out $appm_exclude
  end
end

function appm

end
