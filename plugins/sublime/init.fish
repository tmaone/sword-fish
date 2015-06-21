function sublime.osx
    set -l sublime_paths '/Applications/Sublime Text.app' '/Applications/Sublime Text 2.app'
    for path in $sublime_paths
       if file.exists "$path/Contents/SharedSupport/bin/subl"
          var.global subl "$path/Contents/SharedSupport/bin/subl"
        end
    end
end

function sublime.linux

end

osx sublime.osx
linux sublime.linux
