#!/usr/bin/env fish

if set -q fish_greeting
    set -e fish_greeting
end

if not set -q sword_root
    if test -d (pwd)/core
      set -gx sword_root (pwd)
    else
      if test -d "$HOME/.sword"
        set -gx sword_root "$HOME/.sword"
      end
    end
end

if not set -q sword_core
    set -gx sword_core "$sword_root/core"
end

# Add sword core to fish function path
if not contains $sword_core $fish_function_path
    set fish_function_path $fish_function_path $sword_core
end

import core

function sword.version
  if git.isgit $sword_root
    wd.save
    cd $sword_root
    set -l sword_version (git describe --tags --always)
    out $sword_version
    wd.cd
  end
end

function sword.version.git
        if git.isgit $sword_root
            wd.save
            cd $sword_root
            set -l sword_version_git (git rev-parse --short HEAD)
            out $sword_version_git
            wd.cd
        end
end

function sword.version.remote
        if git.isgit $sword_root
            wd.save
            cd $sword_root
            if net.connected
                set sword_version_remote (git --git-dir="$sword_root/.git" --work-tree="$sword_root" ls-remote origin HEAD | grep HEAD | cut -c 1-7)
            else
                set sword_version_remote (sword.version.git)
            end
            out $sword_version_remote
            wd.cd
        end
end

function sword.version.package
    if test -f $sword_root/VERSION
        set -l sword_version_package (cat $sword_root/VERSION)
        out $sword_version_package
    end
end

#                                 .___              _____.__       .__
#   ________  _  _____________  __| _/    .__     _/ ____\__| _____|  |__  __
#  /  ___/\ \/ \/ /  _ \_  __ \/ __ |   __|  |___ \   __\|  |/  ___/  |  \ \ \
#  \___ \  \     (  <_> )  | \/ /_/ |  /__    __/  |  |  |  |\___ \|   Y  \ \ \
# /____  >  \/\_/ \____/|__|  \____ |     |__|     |__|  |__/____  >___|  / / /
#      \/                          \/                            \/     \/ /_/
function sword.logo
    function sword
        color lightblue
    end
    function plus
        color tomato
    end
    function fishc
        color yellowgreen
    end
    function arrow
        color dimgrey
    end
    # out.ln ""
    out.ln (sword)"                                .___"(plus)"           "(fishc)"  _____.__       .__ "(arrow)""
    out.ln (sword)"  ________  _  _____________  __| _/"(plus)"   .__     "(fishc)"_/ ____\__| _____|  |__ "(arrow)" __"
    out.ln (sword)" /  ___/\ \/ \/ /  _ \_  __ \/ __ | "(plus)" __|  |___ "(fishc)"\   __\|  |/  ___/  |  \ "(arrow)"\ \ "
    out.ln (sword)" \___ \  \     (  <_> )  | \/ /_/ | "(plus)"/__    __/ "(fishc)" |  |  |  |\___ \|   Y  \ "(arrow)"\ \ "
    out.ln (sword)"/____  >  \/\_/ \____/|__|  \____ | "(plus)"   |__|    "(fishc)" |__|  |__/____  >___|  / "(arrow)"/ /"
    out.ln (sword)"     \/                          \/ "(plus)"           "(fishc)"               \/     \/ "(arrow)"/_/"
end

function fish_greeting
    sword.logo
end

function sword.root
    out $sword_root
end

function sword.load.progress.on
    set -xU sword_load_progress
end

function sword.load.progress.off
    set -e sword_load_progress
end


function sword.load.progress
    if set -q sword_load_progress
        return 0
    else
        return 1
    end
end

function sword.status
  set -l sword_status (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status --porcelain)
  if test -z "$sword_status"
    return 1
  else
    return 0
  end
end

function sword.push

  if sword.status
    wd.save
    cd $sword_root
    git.add
    git.commit $argv
    git.push
    wd.cd
  end

end

function sword

end

function on_pwd -v PWD

    if not set -q sword_pwd
        set -xg sword_pwd (wd.get)
    end

    if not test $PWD = "$sword_pwd"
        path.remove "$sword_pwd"
        path.add (wd.get)
        set -xg sword_pwd (wd.get)
    end

end


function on_exit --on-process %self
    echo 'bye.'
end


function sword.init

  var.global sword_version (sword.version)

  plugin.load

  # prompt.load

  theme.load

  color.personal

  if file.exists "$sword_root/user.fish"
    builtin source "$sword_root/user.fish"
  end

  if update.check
    info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
  end

  set -xg sword_init done

end

if status --is-interactive
  sword.init
end

if status --is-login
  # sword.init
end
