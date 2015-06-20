import arg log

function warn
  if arg.has_args $argv
    log.warn $argv
  end
end
