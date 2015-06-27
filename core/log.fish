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
    if arg $argv
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

function log
    if arg $argv
        if log.valid $argv[1]
            if contains $argv[1] $fish_log_levels
                switch $argv[1]
                    case info
                        info "$argv[2..-1]"
                        if log.file
                            echo (log.time) (info "$argv[2..-1]") >> $sword_log_file
                        end
                        return 0
                    case warn
                        warn "$argv[2..-1]"
                        if log.file
                            echo (log.time) (warn "$argv[2..-1]") >> $sword_log_file
                        end
                        return 0
                    case debug
                        debug "$argv[2..-1]"
                        if log.file
                          echo (log.time) (debug "$argv[2..-1]") >> $sword_log_file
                        end
                        return 0
                    case error
                        error "$argv[2..-1]"
                        if log.file
                          echo (log.time) (error "$argv[2..-1]") >> $sword_log_file
                        end
                        return 0
                    case '*'
                        return 1
                end
            end
        else
            return 1
        end
    else
        return 0
    end
end
