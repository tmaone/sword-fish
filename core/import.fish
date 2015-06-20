if not set -q sword_imports
  set -xg sword_imports
end

function import --description 'Imports a core functionality'

  if test (count $argv) -gt 0
    for package in $argv
      if not contains $sword_imports $package
        if test -f "$sword_core/$package.fish"
          set -xg sword_imports $sword_imports $package
          source "$sword_core/$package.fish"
          if functions -q $package.init
            # echo calling $package.init
            eval $package.init
          end
        end
      end
    end
  end

end
