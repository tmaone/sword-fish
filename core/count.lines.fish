function count.lines
  set -l counter 0
  while read -l line
    set counter (math $counter+1)
  end
  echo $counter
end
