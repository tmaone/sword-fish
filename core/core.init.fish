function core.init

  if not var.done core_init
    var.global core_init_functions (fn.list | grep ".init")
    var.remove core_init_functions "core.init"

    for init_function in $core_init_functions
      debug "core.init: $init_function"
      eval $init_function
    end

    profile

    color.personalize

    theme.load

    prompt.load

    plugin.load

    sword.greeting

    if sword.update.check.chance
      info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
    end

    var.global core_init done
  end

end
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
## end


#
# if not var.done sword_init
#
#
# var.global sword_init_functions (fn.list | grep ".init")
# var.remove sword_init_functions core.init
#
# for init_function in $sword_init_functions
#   debug "init: $init_function"
#   eval $init_function
# end
#
#
# profile
#
# color.personalize
#
# theme.load
#
# prompt.load
#
# plugin.load
#
# sword.greeting
#
# if sword.update.check.chance
#   info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
# end
#
# if file.exists "$sword_root/config/default.sword-fish"
#   builtin source "$sword_root/config/default.sword-fish"
# end
#
#
# var.global sword_init done
#
# end

# function on_exit --on-process %self
#   echo 'bye.'
# end
#


#
#
#   # var.global core_init done
#
# # end
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
