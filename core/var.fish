function var
  # builtin set $argv
end

function var.default
  set -U -- $argv
end

function var.global
  set -xg -- $argv
end


function var.local
  set -l -- $argv
end
