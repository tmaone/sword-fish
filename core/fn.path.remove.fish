function fn.path.remove
    if arg.one $argv
        if contains "$argv[1]" $fish_function_path
             set -l idx (contains --index "$argv[1]" $fish_function_path)
             set -e fish_function_path[$idx]
        end
    end
end
