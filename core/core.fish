




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
