function trash.osx
  find.program trash

  function rm
    if arg $argv
      for argument in $argv
        if file.exists "$argument"
          trash "$argument"
        end
        if dir.exists "$argument"
          trash "$argument"
        end
      end
    end
  end

end

function trash.linux

end

osx trash.osx
linux trash.linux
