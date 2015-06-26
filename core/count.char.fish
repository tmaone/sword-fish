function count.char
  if arg $argv
    if file.exists "$argv"
      wc -c $argv
    else
      echo "$argv" | wc -c
    end
  else
    # read | wc -c
  end
end
