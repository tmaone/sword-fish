function file.create
  if not file.exists $argv
    touch $argv
    return 0
  else
    return 1
  end
end
