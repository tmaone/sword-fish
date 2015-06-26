function arg.third
    if test (arg.count $argv) -ge 3
        echo $argv[3]
        return 0
    else
        return 1
    end
end
