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

function wd.save
	set -U sword_wd (eval $pwd)
end

function wd.cd
  cd (wd.get)
end

function wd.clear
  set -e sword_wd
end

function wd.get
  if set -q sword_wd
    echo "$sword_wd"
  else
    echo ""
  end
end
