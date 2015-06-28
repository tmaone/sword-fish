function rm
  if arg $argv
    for argument in $argv
      if file.exists "$argument"
        rm.file "$argument"
      end
      if dir.exists "$argument"
        rm.dir "$argument"
      end
    end
  end
end
