function dir.create
    if arg.one $argv
        if not test -d $argv[1]
            mkdir $argv[1]
        end
    end
end
