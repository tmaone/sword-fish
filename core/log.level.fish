function log.level
    if arg.one $argv
        switch $argv[1]
          case silent
            set -xU log_level silent
            set -xU log_levels
            debug.disable
            warn.disable
            info.disable
            error.disable
          case error
            set -xU log_level error
            set -xU log_levels error
            debug.disable
            warn.disable
            info.disable
            error.enable
          case info
            set -xU log_level info
            set -xU log_levels info error
            debug.disable
            warn.disable
            info.enable
            error.enable
          case warn
            set -xU log_level warn
            set -xU log_levels warn info error
            debug.disable
            warn.enable
            info.enable
            error.enable
          case debug
            set -xU log_level debug
            set -xU log_levels debug warn info error
            debug.enable
            info.enable
            warn.enable
            error.enable
          case '*'
              error.invalid $argv[1]
        end
    else
      echo "$log_level"
    end
end
