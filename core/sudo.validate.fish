function sudo.validate
    if eval $sudo -v > /dev/null
        return 0
    else
        return 1
    end
end
