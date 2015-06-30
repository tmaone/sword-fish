function file.list

  if arg.one $argv
    if dir.exists $argv[1]
      call $find $argv[1] -maxdepth 1 -type f -exec basename \{\} \;
      return 0
    else
      call $find (pwd) -maxdepth 1 -type f -name "$argv[1]" -exec basename \{\} \;
      return 0
    end
  end

  if arg.two $argv
    if dir.exists $argv[1]
      call $find $argv[1] -maxdepth 1 -type f -name "$argv[2]" -exec basename \{\} \;
      return 0
    end
    if dir.exists $argv[2]
      call $find $argv[2] -maxdepth 1 -type f -name "$argv[1]" -exec basename \{\} \;
      return 0
    end
    error "error"
    return 1
  end

  call $find (pwd) -maxdepth 1 -type f -exec basename \{\} \;
  return 0
end
