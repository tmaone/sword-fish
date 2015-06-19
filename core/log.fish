import arg color
#temp

if not test $LOGNAME = 'swordfish'
    set -xg LOGNAME 'swordfish'
end

if not test -d "$sword_root/log"
    mkdir "$sword_root/log"
end

if not set -q fish_log_file
    set -xg fish_log_file "$sword_root/log/sword.log"
end

if not test -f "$fish_log_file"
    touch "$fish_log_file"
end

if not set -q fish_log_to_file
    set -xU fish_log_to_file off
end

function log.level
    if [ (count $argv) -gt 0 ]
        switch $argv[1]
            case debug
                set -xU fish_log_level debug
                set -xU fish_log_levels debug info warn error
            case info
                set -xU fish_log_level info
                set -xU fish_log_levels info warn error
            case warn
                set -xU fish_log_level warn
                set -xU fish_log_levels warn error
            case error
                set -xU fish_log_level error
                set -xU fish_log_levels warn error
            case '*'
                error.invalid $argv[1]
        end
    end
    echo "$fish_log_level"
end

if not set -q fish_log_level
   log.level info > /dev/null
end

function log.info
    log info "$argv"
end

function log.error
    log error "$argv"
end

function log.debug
    log debug "$argv"
end

function log.warn
    log warn "$argv"
end

function log.valid
    if test (count $argv) -eq 1
    switch $argv[1]
        case info
            return 0
        case warn
            return 0
        case debug
            return 0
        case error
            return 0
        case '*'
            return 1
    end
    end
end

function log.file
    if test (count $argv) = 0
        echo "$fish_log_to_file"
    end
    if test (count $argv) = 1
        switch $argv[1]
        case on
            set -xU fish_log_to_file "on"
            return 0
        case off
            set -xU fish_log_to_file "off"
            return 0
        case clear
            echo "" > "$fish_log_file"
            return 0
        case '*'
            invalid
            return 1
        end
    end
end

function log
    if arg.has_args $argv
        if log.valid $argv[1]
            if contains $argv[1] $fish_log_levels
                switch $argv[1]
                    case info
                        echo (color.green)"["(color.white)"$argv[1]"(color.green)"]"(color.normal) "$argv[2..-1]"(color.green)"."(color.normal)
                        return 0
                    case warn
                        echo (color.green)"["(color.yellow)"$argv[1]"(color.green)"]"(color.normal) "$argv[2..-1]"(color.green)"."(color.normal)
                        return 0
                    case debug
                        echo (color.green)"["(color.purple)"$argv[1]"(color.green)"]"(color.normal) "$argv[2..-1]"(color.green)"."(color.normal)
                        return 0
                    case error
                        echo (color.green)"["(color.red)"$argv[1]"(color.green)"]"(color.normal) "$argv[2..-1]"(color.green)"."(color.normal)
                        return 0
                    case '*'
                        return 1
                end
                if test $fish_log_to_file = on
                    echo "[$argv[1]] $argv[2..-1]." >> $fish_log_file
                end
            end
        else
            return 1
        end
    else
        return 0
    end
end
