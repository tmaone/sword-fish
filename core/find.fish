function find.init
  # if not set -q found
  set -xg which (which which)
  set -xg found "which"
  # end
end

function find
    if arg $argv
      /usr/bin/find $argv
    end
end

function find.program

    if arg.one $argv
      set -l find_program "$argv[1]"
      # debug "find.program: [$found] [$find_program]"
      if not contains $find_program $found
        set -l find_bin (eval $which $find_program)
        # debug "find.program: adding $argv[1] with $find_bin"
        if not test -z $find_bin
          set -xg $find_program $find_bin
          set -xg found $found $find_program
          # debug "find.program: $find_program $find_bin [$found]"
        else
          # debug "find.program: $find_program : $find_bin"
        end
      else
        # debug "find.program: $find_program contains $found"
      end
    end
    # set -l find_bin
    #
    #
    #   # debug $argv
    #   if not contains $found $argv[1]
    #     # debug not contains $argv
    #     set find_program $argv[1]
    #     set find_bin (eval $which "$argv[1]")
    #     # debug $find_program $find_bin
    #     # return 1
    #     if not test -z "$find_bin"
    #       debug "find.program: [$find_program] -> [$find_bin]"
    #       set -xg $find_program $find_bin
    #       set -xg found $found $argv
    #       return 0
    #     else
    #       debug "find.program: [$find_program] not found"
    #       return 1
    #     end
    #   else
    #     return 0
    #   end
    # end
    # else
        # debug "Program [$find_program] not found"
        # return 1
    # end
end

function find.path

end

function find.file

end

function find.directory

end
