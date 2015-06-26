function pwd
  builtin pwd
end
# set -g fish_program_pwd

# if not test -z (which 'pwd')
#   set -g fish_program_pwd (which 'pwd')
# else
#   set -g fish_program_pwd 'builtin pwd'
# end

function wd
    eval $pwd
end

function wd.init
  find.program pwd
end

# function wd.print
#   echo (eval $pwd)
# end
