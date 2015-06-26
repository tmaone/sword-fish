function arg.many
    if test (count $argv) -gt 3
        return 0
    else
        return 1
    end
end
