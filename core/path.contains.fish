function path.contains
    if arg.one $argv
        if test -d "$argv[1]"
            if contains "$argv[1]" $PATH
              return 0
            else
              return 1
            end
        else
          return 1
        end
    end
end
