#!/usr/bin/env fish

if set -q fish_greeting
    set -e fish_greeting
end

if functions -q fish_greeting
    functions -e fish_greeting
end

if not set -q sword_root
    set -gx sword_root "$HOME/.sword"
end

if not set -q sword_core
    set -gx sword_core "$sword_root/core"
end

# Add sword core to fish function path
if not contains $sword_core $fish_function_path
    set fish_function_path $fish_function_path $sword_core
end

if not set -q sword_imports
  import arg
end

# Add sword core to fish function path
if contains $sword_core $fish_function_path
  set -l idx (contains --index $sword_core $fish_function_path)
  set -e fish_function_path[$idx]
end

# if not set -q sword_version
#   set -xg sword_version (cat version)
# end

# if not set -q sword_core
#     set -xg sword_core arg array call clock color commands counter debug dev directory direnv disk edit error file find fn fun git host import locate log net os osx path plugin profile progress prompt setting src string sudo user uuid var wd
# end

function sword
  arg.count $argv
  # echo "Sword-Fish"
  # echo $sword_version`
end
# echo ha


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
