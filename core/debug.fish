import arg log

function debug
  if arg.has_args $argv
    log.debug $argv
  end
end
