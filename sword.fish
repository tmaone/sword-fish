#!/usr/bin/env fish

if set -q fish_greeting
    set -e fish_greeting
end

if functions -q fish_greeting
    functions -e fish_greeting
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

function sword.version.package
    if test -f $sword_root/version
        set -l sword_version_package (cat $sword_root/version)
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
    function fish
        color yellowgreen
    end
    function arrow
        color dimgrey
    end
    # out.ln ""
    out.ln (sword)"                                .___"(plus)"           "(fish)"  _____.__       .__ "(arrow)""
    out.ln (sword)"  ________  _  _____________  __| _/"(plus)"   .__     "(fish)"_/ ____\__| _____|  |__ "(arrow)" __"
    out.ln (sword)" /  ___/\ \/ \/ /  _ \_  __ \/ __ | "(plus)" __|  |___ "(fish)"\   __\|  |/  ___/  |  \ "(arrow)"\ \ "
    out.ln (sword)" \___ \  \     (  <_> )  | \/ /_/ | "(plus)"/__    __/ "(fish)" |  |  |  |\___ \|   Y  \ "(arrow)"\ \ "
    out.ln (sword)"/____  >  \/\_/ \____/|__|  \____ | "(plus)"   |__|    "(fish)" |__|  |__/____  >___|  / "(arrow)"/ /"
    out.ln (sword)"     \/                          \/ "(plus)"           "(fish)"               \/     \/ "(arrow)"/_/"
end

var.global sword_version (sword.version)

plugin.load

# if not set -q sword_imports
# import arg array color debug error info log out warn
# end
#
# Add sword core to fish function path
# if contains $sword_core $fish_function_path
#   set -l idx (contains --index $sword_core $fish_function_path)
#   set -e fish_function_path[$idx]
# end

# if not set -q sword_version
#   set -xg sword_version (cat version)
# end

# if not set -q sword_core
#     set -xg sword_core arg array call clock color commands counter debug dev directory direnv disk edit error file find fn fun git host import locate log net os osx path plugin profile progress prompt setting src string sudo user uuid var wd
# end

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

function sword.check_update
    # debug set -q sword_updated | progress
    #
    # if not set -q sword_updated

        set -l version_local_git (sword.version.git)
        set -l version_remote_git ''

        if net.connected
            set version_remote_git (git --git-dir="$sword_root/.git" --work-tree="$sword_root" ls-remote origin HEAD | grep HEAD | cut -c 1-7)
        else
            set version_remote_git (sword.version.git)
        end

        debug "sword+fish ("$version_local_git")~>("$version_remote_git")"

        if string.equals "$version_local_git" "$version_remote_git"
            info 'sword+fish is up-to-date..'
            set -xg sword_updated
            return 1
        else
            info "sword+fish update available... ("$version_local_git")~>("$version_remote_git")"
            set -xg sword_updated
            return 0
        end
    # else
        # return 1
    # end
end

function sword.update
    if sword.check_update
        call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" pull
        reload
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
    out 'done'
end


# function sword.version
#     printf "%s %s" (sword.version.package) (sword.version.git)
# end
#
# function sword.version.git
#         if test -d $sword_root/.git
#             wd.save
#             cd $sword_root
#             set -xg sword_version_git (git rev-parse --short HEAD)
#             printf "%s" $sword_version_git
#             wd.cd
#         end
# end
#
# function sword.version.package
#     if test -f $sword_rootot/version
#         set -xg sword_version_package (cat $sword_root/version)
#         printf "%s" $sword_version_package
#     end
# end
