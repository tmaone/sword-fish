function arg.one
    if test (count $argv) -eq 1
        return 0
    else
        return 1
    end
end
