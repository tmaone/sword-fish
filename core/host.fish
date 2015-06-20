import arg sudo string log

if not set -q fish_program_host
    set -g fish_program_host (which host)
end

function host
    if arg.one $argv
        eval $fish_program_host $argv
    else
    end
end

function host.exists
    if test (count $argv) = 1
        if eval $fish_program_host "$argv[1]" | grep address > /dev/null 2>&1
            set -l ip (eval $fish_program_host "$argv[1]" | grep address | cut -d" " -f 4 | head -n 1)
            log.info Host $argv[1] exists with ip: "$ip"
            return 0
        else
            log.info Host $argv[1] does not exist
            return 1
        end
    else
        err.invalid
        return 1
    end
end

function host.live
    if test (count $argv) = 1
        if host.exists "$argv[1]" > /dev/null
            if ping -c 1 "$argv[1]" > /dev/null 2>&1
                log.info Host $argv[1] is alive
                return 0
            else
                log.info Host $argv[1] is dead
                return 1
            end
        else
            log.info Host $argv[1] does not exist
            return 1
        end
    else
        error.invalid $argv
        return 1
    end
end

function host.name
    if arg.one $argv
        if sudo.validate
            sudo hostname $argv[1]
        end
    else
        hostname
    end
end

function host.extension
    if arg.one $argv
        if string.contains $argv[1] '.'
            echo $argv[1] | awk -F '.' '{print $NF}'
        else
            log.debug "Host $argv[1] does not have an extenstion in it's hostname"
        end
    else
        if string.contains (host.name) '.'
            echo (host.name) | awk -F '.' '{print $NF}'
        else
            log.debug "Local host does not have extenstion in it's hostname"
        end
    end
end
