import arg log

function info
  if arg.has_args $argv
    log.info $argv
  end
end
