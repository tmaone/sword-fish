function path.remove
    if arg.one $argv
        # if test -d "$argv[1]"
            if contains "$argv[1]" $PATH
                set -l idx (contains --index "$argv[1]" $PATH)
                set -e PATH[$idx]
            end
        # end
    end
end
