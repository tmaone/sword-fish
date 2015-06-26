function arg.first
    if arg.one $argv
        echo $argv
        return 0
    else
        return 1
    end
end
