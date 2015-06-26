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
