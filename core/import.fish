if not set -q sword_imports
  set -xg sword_imports ""
end

function import --description 'Imports a core functionality'
  if test (count $argv) -eq 1
    # out has
      if not contains $sword_imports $argv
      # out not contains
        if test -f "$sword_core/$argv.fish"
          set -xg sword_imports $sword_imports $argv
          builtin source "$sword_core/$argv.fish"
          # out "sourcing $argv"
          if functions -q "$argv.init"
          #  out "evaling" "$argv.init"
            eval $argv.init
            # out (progress) "\n"
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

function import.clear --description 'Clears imported core functionality'
  set -xg sword_imports ""
end
