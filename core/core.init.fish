function core.init

# if not var.done core_init
#
#   debug "sword-fish root [$sword_root]"
#
#   var.global init_functions (fn.list | grep ".init")
#   var.remove init_functions "core.init"
#
#   for init_function in $init_functions
#     eval "$init_function"
#     debug "core.init: $init_function"
#   end
#
#   profile
#
#   function fish_greeting
#
#     set -l info_line (printf "%s%s %s %s %s %s %s%s" (set_color $fish_color_autosuggestion[1]) (host.name) (os) (os.kernel) (os.arch) (user.who) (os.uptime) (set_color normal))
#
#     out.ln $info_line
#
#     sword.logo
#
#     # set -l line1 (printf (_ 'Welcome to fish, the friendly interactive shell') )
#     # set -l line2 (printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
#     # out.ln "$line1"
#     # out.ln "$line2"
#
#     if sword.update.check.chance
#       info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
#     end
#
#   end
#
#   plugin.load
#
#   prompt.load
#
#   theme.load
#
#   color.personalize
#
#   if file.exists "$sword_root/config/default.sword-fish"
#       builtin source "$sword_root/config/default.sword-fish"
#   end
#
#   function on_exit --on-process %self
#       echo 'bye.'
#   end
#
#   function on_pwd -v PWD
#
#       if not var.exists pwd
#           set -xg pwd (pwd.get)
#       end
#
#       if not test $PWD = (pwd.get)
#           path.remove "$pwd"
#           path.add (pwd)
#           pwd.save
#       end
#
#   end
#
#   var.global core_init done
#
# end

end
