function fn.list
  set -l fns (functions | tr ', ' '\n')
  for fn in $fns
    echo $fn
  end
end
