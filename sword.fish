# !/usr/bin/env fish

if not var.done sword_init

if not set -q sword_root
  if test -d "$HOME/.sword"
    set -xg sword_root "$HOME/.sword"
  end
end

if not set -q sword_core
    set -xg sword_core "$sword_root/core"
end

# Add sword core to fish function path
# Add first in order to be searched first
if not contains $sword_core $fish_function_path
    set fish_function_path $sword_core $fish_function_path
end

var.global sword_init_functions (fn.list | grep ".init")
var.remove sword_init_functions core.init

for init_function in $sword_init_functions
  debug "init: $init_function"
  eval $init_function
end

debug "sword-fish root [$sword_root]"

profile

color.personalize

theme.load

prompt.load

plugin.load

sword.greeting

if sword.update.check.chance
  info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
end

if file.exists "$sword_root/config/default.sword-fish"
  builtin source "$sword_root/config/default.sword-fish"
end


var.global sword_init done

end

# function on_exit --on-process %self
#   echo 'bye.'
# end
#
# function on_pwd -v PWD
#
#   if not var.exists pwd
#     pwd.save
#   end
#
#   if not test $PWD = (pwd.get)
#     if path.contains (pwd.get)
#       path.remove (pwd.get)
#     end
#     pwd.save
#     path.add (pwd.get)
#   end
#
# end

#
#
#   # var.global core_init done
#
# # end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# # core.init
#
# # function fish_greeting -d "what's up, fish?"
# #   set_color $fish_color_autosuggestion[1]
# #   printf "%s %s %s %s\n" (host.name) (os) (os.kernel) (os.arch)
# #   # uname -nsr
# #   # uptime
# #   set_color normal
# # end
#
# # function sword
# #
# # end
#
# if status --is-interactive
#
# end
#
# if status --is-login
#
# end;
#
# # var.global sword done
