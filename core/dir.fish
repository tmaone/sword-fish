function dir

end


function dir.exists
  if test -d $argv
    return 0
  else
    return 1
  end
end


function dir.create
    if arg.one $argv
        if not test -d $argv[1]
            mkdir $argv[1]
        end
    end
end

function dir.size --description 'Size of directories in MB'
    if not arg $argv
        debug "dir.size: Using current dir"
        find . -maxdepth 1 -type d -exec du -smh \{\} \;
    else
        if arg.one $argv and not arg.two $argv
            find $argv[1] -maxdepth 1 -type d -exec du -smh \{\} \;
        else
            error.invalid $argv
        end
    end
end
