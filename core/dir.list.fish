function dir.list
  if arg $argv
    if dir.exists "$argv"
      call $find "$argv" -maxdepth 1 -type d -exec basename \{\} \; | grep -v (basename "$argv")
    end
  else
    call $find (pwd) -maxdepth 1 -type d -exec basename \{\} \; | grep -v (basename (pwd))
  end
end
