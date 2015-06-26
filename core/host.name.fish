function host.name
    if arg.one $argv
        if sudo.validate
            eval $sudo $hostname $argv[1]
        end
    else
        eval $hostname
    end
end
