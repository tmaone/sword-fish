function host.extension
    if arg.one $argv
        if string.contains $argv[1] '.'
            echo $argv[1] | awk -F '.' '{print $NF}'
        else
            debug "Host $argv[1] does not have an extenstion in it's hostname"
        end
    else
        if string.contains (host.name) '.'
            echo (host.name) | awk -F '.' '{print $NF}'
        else
            debug "Local host does not have extenstion in it's hostname"
        end
    end
end
