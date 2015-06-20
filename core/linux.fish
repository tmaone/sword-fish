function linux --description 'Evaluates the command if the current Operating System is Linux'
    if set -q OS
        if test $OS = "linux"
            if arg $argv
                eval $argv
            end
            return 0
        else
            return 1
        end
    else
        return 1
    end
end
