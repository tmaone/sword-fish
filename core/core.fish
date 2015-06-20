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

    import in
    import out

    set -xg sword_core_init "done"

  end

end
