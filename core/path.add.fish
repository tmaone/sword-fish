function path.add --description 'Adds a directory in the PATH variable'
    if arg.one $argv
        if test -d "$argv[1]"
            if not contains "$argv[1]" $PATH
                set -xg PATH $PATH "$argv[1]"
            end
        end
    end
end
