function file.init
  find.program file
end

function file
  if arg $argv
    call $file $argv
  end
end

function file.exists
  if test -f $argv
    return 0
  else
    return 1
  end
end


function file.empty --description 'Show empty files '
    if  test arg.count = 1
        find "$argv" -type f -empty
    else
        find . -type f -empty
    end
end

function file.sanitize
  sudo chmod -R u=rwX,go=rX $argv
  sudo chown -R $USER:staff $argv
end

function file.extension
    if test (count $argv) = 1
        if test -f $argv
            ls $argv | awk -F '.' '{print $NF}'
        end
    end
end
