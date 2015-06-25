function core --description "sword-fish core"

end

function core.init

  if not set -q sword_core_init

    import arg

    import array

    import call

    import var

    import string

    import find

    import wd

    import dir

    import file

    import in out

    import progress
    
    import color

    import log

    import info

    import warn

    import debug

    import error

    import profile

    import disk

    import cpu

    import download

    import fish

    import fn

    import ask

    import linux

    import osx

    import host

    import path

    import hash

    import net

    import ps

    import plugin

    import theme

    import setting

    import src

    import sudo

    import uuid

    import time

    import date

    import reload

    import git

    import update

    import prompt

    set -xg sword_core_init "done"
    debug "core.init done"
  end

end
