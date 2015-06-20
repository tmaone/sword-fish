function osx --description 'Evaluates the command if the current OS is MacOS'
    if set -q OS
        if test $OS = "darwin"
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
