import arg

function out
  if arg.has_args $argv
    echo -n $argv
  end
end
