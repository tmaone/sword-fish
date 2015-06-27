function host.extension
    if arg.one $argv
        if string.contains $argv[1] '.'
            echo $argv[1] | awk -F '.' '{print $NF}'
        else
            out " "
        end
    else
        if string.contains (host.name) '.'
            echo (host.name) | awk -F '.' '{print $NF}'
        else
            out " "
        end
    end
end
