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
