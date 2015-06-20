function find
    if arg $argv
      /usr/bin/find $argv
    end
end

function find.program

    set -l find_program
    set -l find_bin

    if test (count $argv) = 1
        set find_program $argv
        set find_bin (which $argv)
    end

    if test (count $argv) = 2
        set find_program $argv[1]
        set find_bin (which $argv[2])
    end

    if not test -z "$find_program" -o -z "$find_bin"
        debug "Program found [$find_program] -> [$find_bin]"
        set -xg $find_program $find_bin
        return 0
    else
        debug "Program [$program] not found"
        return 1
    end

end

function find.path

end

function find.file

end

function find.directory

end
