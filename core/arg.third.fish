function arg.third
    if arg.three $argv
        echo $argv[3]
        return 0
    else
        return 1
    end
end
