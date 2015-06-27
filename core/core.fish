# if not set -q sword_core_modules
#   set -xg sword_core_modules arg array call var string find wd dir file in out color log info warn debug error profile fn ask linux osx path net git fish disk cpu download host hash ps setting src sudo uuid time date reload update prompt term plugin theme
# end

# function core.init
#
#     functions -e core.init
#
#     set -l init_functions (fn.list | grep ".init")
#     echo $init_functions
#
#     for init_function in $init_functions
#       # echo Initializing $init_function
#       eval "$init_function"
#     end
#


    # emit sword_initialize

    # var.global sword_version (sword.version)

    # for core_module in $sword_core_modules
    #   if set -q sword_load_progress
    #     # import "$core_module" | progress
    #   else
    #     # import "$core_module"
    #   end
    # end

    # if set -q sword_load_progress
    #   echo
    # end

    #

    # if file.exists "$sword_root/config/default.sword-fish"
        # builtin source "$sword_root/config/default.sword-fish"
    # end

    # plugin.load

    # prompt.load

    # theme.load

    # color.personal

    # if update.check
    #   info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
    # end

    # set sword_core_init "done"

  # end
#
# end
# if set -q fish_greeting
#     set -e fish_greeting
# end
#
# function fish_greeting
#     # sword.logo
# end
#
# function sword.root
#     out $sword_root
# end
#
# function sword.load.progress.on
#     set -xU sword_load_progress
# end
#
# function sword.load.progress.off
#     set -e sword_load_progress
# end
#
#
# function sword.load.progress
#     if set -q sword_load_progress
#         return 0
#     else
#         return 1
#     end
# end
#
# function sword.status
#   set -l sword_status (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status --porcelain)
#   if test -z "$sword_status"
#     return 1
#   else
#     return 0
#   end
# end
#
# function sword.push
#
#   if sword.status
#     wd.save
#     cd $sword_root
#     git.add
#     git.commit $argv
#     git.push
#     wd.cd
#   end
#
# end


# function on_pwd -v PWD
#
#     if not set -q sword_pwd
#         set -xg sword_pwd (wd.get)
#     end
#
#     if not test $PWD = "$sword_pwd"
#         path.remove "$sword_pwd"
#         path.add (wd.get)
#         set -xg sword_pwd (wd.get)
#     end
#
# end


#
# # function on_exit --on-process %self
#     # echo 'bye.'
# # end
#

# end


# command

function core --description "sword-fish core"

end
