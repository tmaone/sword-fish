if not set -q log_filename
    set -xg log_filename  'sword-fish.log'
end

if not set -q log_path
  set -xg log_path $sword_root/log
  if not test -d $log_path
    mkdir -p $log_path
  end
end

if not set -q sword_log_file
    set -xg sword_log_file $log_path/$log_filename
    if not test -f $sword_log_file
      touch $sword_log_file
    end
end

# if not set -q sword_log_file
#     set -xU sword_log_file off
# end

function log.level
    if [ (count $argv) -gt 0 ]
        switch $argv[1]
            case debug
                set -xU log_level debug
                set -xU log_levels debug info warn error
            case info
                set -xU log_level info
                set -xU log_levels info warn error
            case warn
                set -xU log_level warn
                set -xU log_levels warn error
            case error
                set -xU ≈ error
                set -xU log_levels warn error
            case '*'
                error.invalid $argv[1]
        end
    end
    echo "$log_levels"
end

if not set -q log_levels
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


function log.file.on
  set -xU log_to_file "on"
  return 0
end

function log.file.off
  set -xU log_to_file "off"
  return 0
end

function log.file.clear
  if file.exists "$sword_log_file"
    echo "" > "$sword_log_file"
    return 0
  else
    return 1
  end
end

if not set -q log_to_file
  log.file.off > /dev/null
end

function log.file
    if not arg $argv
      if test "$log_to_file" = on
        return 0
      else
        return 1
      end
    end
    if test (count $argv) = 1
        switch $argv[1]
        case on
          log.file.on
        case off
          log.file.off
        case clear
          log.file.clear
        case '*'
            invalid
            return 1
        end
    end
end

function log.time
  out (color normal)"["(color darkslategrey)(date.time)(color normal)"]"
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
