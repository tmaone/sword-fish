function string

end

function string.split
    if arg.two $argv
        echo $argv[1] | tr $argv[2] '\n'
        # call echo $argv[1] | sed "s/$argv[2]/\n/g"
        # echo $argv[2] | sed s/$argv[1]/\ /g
    end
end

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

function string.contains
    if arg.two $argv
        switch $argv[1]
            case "*$argv[2]*"
                # echo has it
                return 0
            case '*'
                # echo not has it
                return 1
        end
        # echo "$argv[2]" | tr "$argv[1]" '\n'
    end
end
