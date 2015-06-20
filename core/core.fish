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

    import profile

    import dir

    import disk

    import download

    import file

    import fish

    import fn

    import linux

    import osx

    import path

    import net

    import plugin

    import prompt

    import setting

    import src

    import sudo

    import uuid

    import info warn debug error

    import time

    import date

    import reload

    import git

    import wd

    set -xg sword_core_init "done"
    debug "core.init done"

  end

end
