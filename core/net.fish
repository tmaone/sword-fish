

function net

end


function net.connected
    if ping -W 1 -c 1 www.google.com > /dev/null ^ /dev/null
        return 0
    else
        return 1
    end
end
