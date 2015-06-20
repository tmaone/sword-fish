import arg log

function error
  if arg.has_args $argv
    log error $argv
  end
end
