function import --description 'Imports a core functionality'

  if not set -q sword_imports
    set -xg sword_imports
  end

  if test (count $argv) -gt 0
    for package in $argv
      if not contains $package $sword_imports
        if test -f "$sword_core/$package.fish"
          set -xg sword_imports $sword_imports $package
          source "$sword_core/$package.fish"
          if functions -q $package.init
            # echo calling $package.init
            eval $package.init
            # else
            # echo $package does not have init
          end
          return 0
        else
          # echo "$sword_core/$package.fish" does not exist
          return 1
        end
      else
        return 0
        # echo "$package" already in "$imports"
      end
    end
  end

end


#
#   for package in $argv
#
#   end
# end

                    # echo $package "   - >>  " $imports

                    # echo loading $package
                    # if test -f "$sword_functions/$package.fish"


                    # end
                    # echo $package loaded
    #             else
    #                 # echo $package already loaded
    #             end
    #         else
    #             return 1
    #             echo file "$sword_functions/$package.fish" does not exist
    #         end
    #     end
    # end
