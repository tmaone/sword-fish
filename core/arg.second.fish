function arg.second
    if test (arg.count $argv) -ge 2
        echo $argv[2]
        return 0
    else
        return 1
    end
end
