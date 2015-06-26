function host.exists
    if test (count $argv) = 1
        if eval $host "$argv[1]" | grep address > /dev/null 2>&1
            set -l ip (eval $host "$argv[1]" | grep address | cut -d" " -f 4 | head -n 1)
            info Host $argv[1] exists with ip: "$ip"
            return 0
        else
            info Host $argv[1] does not exist
            return 1
        end
    else
        err.invalid
        return 1
    end
end
