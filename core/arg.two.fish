function arg.two
    if test (count $argv) -eq 2
        return 0
    else
        return 1
    end
end
