function host.live
    if test (count $argv) = 1
        if host.exists "$argv[1]" > /dev/null
            if ping -c 1 "$argv[1]" > /dev/null 2>&1
                info Host $argv[1] is alive
                return 0
            else
                info Host $argv[1] is dead
                return 1
            end
        else
            info Host $argv[1] does not exist
            return 1
        end
    else
        error invalid $argv
        return 1
    end
end
