function string.equals
    if arg.two $argv
        if test "$argv[1]" = "$argv[2]"
            return 0
        else
            return 1
        end
    else
        return 1
    end
end
