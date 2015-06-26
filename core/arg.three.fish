function arg.three
    if test (count $argv) -eq 3
        return 0
    else
        return 1
    end
end
