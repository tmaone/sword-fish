function debug.off
    set -xU sword_debug off
end

function debug.on
    set -xU sword_debug on
end

function debug.enabled
    if set -qU sword_debug
        if test $sword_debug = on
            return 0
        else
            return 1
        end
    else
        debug.off
        return 1
    end
end

function debug
  if debug.enabled
    if arg $argv
      switch $argv[1]
        case eval
          eval $argv
        case '*'
          out.ln (color $color_debug)debug(color $color_normal) $argv
      end
    end
    # and arg $argv
    # eval $argv
    # log.debug $argv
  end
end
out
