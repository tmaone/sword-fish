function sudo.invalidate
    if eval $sudo -k > /dev/null
        return 0
    else
        return 1
    end
end
