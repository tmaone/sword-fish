function arg.second
    if arg.two $argv
        echo $argv[2]
        return 0
    else
        return 1
    end
end
