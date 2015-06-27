function count.lines
  set -l counter 0

  if not arg $argv
    while read -l line
      set counter (math $counter+1)
    end
  else

  end

  echo $counter
end
