function core --description "sword-fish core"

end

function core.init

  if not set -q sword_core_init

    import arg

    import array

    import call

    import var

    import string

    import color

    import in out

    import log

    import find

    import dir

    import info warn debug error

    import time

    import date

    import reload

    set -xg sword_core_init "done"
    debug "core.init done"

  end

end
