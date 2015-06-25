if not set -q sword_imports
  set -xg sword_imports
end

function import --description 'Imports a core functionality'
  if test (count $argv) -gt 0

    for package in $argv
      if not contains $sword_imports $package
        if test -f "$sword_core/$package.fish"
          set -xg sword_imports $sword_imports $package
          builtin source "$sword_core/$package.fish"
          if functions -q $package.init
            eval "$package.init"
          end
          return 0;
        else
          return 1;
        end
      else
        return 0;
      end
    end

  end
end

function import.clear --description 'Clears imported core functionality'
  set -xg sword_imports ""
end
