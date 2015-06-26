function fn.path.add --description 'Adds a directory in the functions path'
    if test -d "$argv[1]"
        if not contains $fish_function_path "$argv[1]"
            set fish_function_path $fish_function_path "$argv[1]"
        end
    end
end
