function fn
    if arg $argv
        builtin function $argv
    end
end


function fn.path
    if set -q fish_function_path
        echo $fish_function_path
    end
end

function fn.path.add --description 'Adds a directory in the functions path'
    if test -d "$argv[1]"
        if not contains $fish_function_path "$argv[1]"
            set fish_function_path $fish_function_path "$argv[1]"
        end
    end
end

function fn.path.remove
    if arg.one $argv
        if contains "$argv[1]" $fish_function_path
             set -l idx (contains --index "$argv[1]" $fish_function_path)
             set -e fish_function_path[$idx]
        end
    end
end

function fn.path.clean
    if set -q fish_function_path
        var.clean fish_function_path
    end
end
