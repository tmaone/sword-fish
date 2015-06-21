# function user.rsa.public
#     if test -f $HOME/.ssh/id_rsa.pub
#         cat $HOME/.ssh/id_rsa.pub | tr -d '\n'
#     end
# end
#
#
# function user.rsa.private
#     if test -f $HOME/.ssh/id_rsa
#         cat $HOME/.ssh/id_rsa
#     end
# end
#
# function user.rsa
#     if not test -d $HOME/.ssh
#         dir.create $HOME/.ssh
#     end
#     if not test -f $HOME/.ssh/id_rsa -a -f $HOME/.ssh/id_rsa.pub
#         ssh-keygen -q -N '' -t rsa -f $HOME/.ssh/id_rsa
#     end
#     if arg.one $argv
#         switch $argv[1]
#           case 'private'
#             user.rsa.private
#           case 'public'
#             user.rsa.public
#           case '*'
#             # commands;
#         end
#     end
# end

function ssh

end
