if not set -q fish_program_sudo
    set -xg fish_program_sudo (which sudo)
end

function sudo.init
  find.program sudo
  if not set -q sudo
    set -xg sudo 'su -u root '
  end
end

function sudo
    if arg $argv
      # if not test -q sudo
        eval $sudo $argv
      # else
        # su -u root $argv
      # end
    end
end

function sudo.validate
    if eval $sudo -v > /dev/null
        return 0
    else
        return 1
    end
end

function sudo.invalidate
    if eval $sudo -k > /dev/null
        return 0
    else
        return 1
    end
end
