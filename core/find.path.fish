function find.path
    # echo $argv
    if arg.one $argv
      call $which -a "$argv[1]"
    end
      # for path in $PATH
        # out $path
        # if test -f $path/$argv[1]
          # out "$path/$argv[1] "
        # end
      # end
end
