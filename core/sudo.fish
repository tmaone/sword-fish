function sudo
    if arg $argv
      # if not test -q sudo
        eval $sudo $argv
      # else
        # su -u root $argv
      # end
    end
end
