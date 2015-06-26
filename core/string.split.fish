function string.split
    if arg.two $argv
        echo $argv[1] | tr $argv[2] '\n'
        # call echo $argv[1] | sed "s/$argv[2]/\n/g"
        # echo $argv[2] | sed s/$argv[1]/\ /g
    end
end
