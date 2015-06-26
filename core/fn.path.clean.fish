function fn.path.clean
    if set -q fish_function_path
        var.clean fish_function_path
        for path in $fish_function_path
          if not dir.exists "$path"
            fn.path.remove "$path"
            debug "Removing non existing path: ["$path"]"
          end
        end
    end
end
