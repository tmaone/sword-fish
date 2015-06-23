function path
  echo $PATH
end

function path.add --description 'Adds a directory in the PATH variable'
    if arg.one $argv
        if test -d "$argv[1]"
            if not contains "$argv[1]" $PATH
                set -xg PATH $PATH "$argv[1]"
            end
        end
    end
end

function path.remove
    if arg.one $argv
        if test -d "$argv[1]"
            if contains "$argv[1]" $PATH
                set -l idx (contains --index "$argv[1]" $PATH)
                set -e PATH[$idx]
            end
        end
    end
end

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


function path.clean
    var.clean PATH
end
