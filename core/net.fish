function net

end

function net.init
  find.program ping
  end

function net.connected
    call $ping -W 1 -c 1 www.google.com > /dev/null ^ /dev/null
    set -l exit_status $status
    if test "$exit_status" = 0
      return 0
    else
      return 1
    end
    # if ping -W 1 -c 1 www.google.com > /dev/null ^ /dev/null
    #     return 0
    # else
    #     return 1
    # end
end
