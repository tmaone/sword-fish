function file.extension

  if test (count $argv) = 0

  end

  if test (count $argv) = 1
    if test -f $argv
      ls $argv | awk -F '.' '{print $NF}'
    else
      set files (find (wd) -maxdepth 1 -type f -name "*.$argument" -print)
      for file in $files
        file.name $file
      end
    end
  end

  if arg.two $argv
    for argument in $argv
      # echo $argument
      # ls $argument | awk -F '.' '{print $NF}'
      set files (find (wd) -maxdepth 1 -type f -name "*.$argument" -print)
      for file in $files
        # echo $file
        file.name $file
      end
    end
  end

end
