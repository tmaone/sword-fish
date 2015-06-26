function path.clean
    var.clean PATH
    for path in $PATH
      if not dir.exists "$path"
        path.remove "$path"
      end
    end
end
