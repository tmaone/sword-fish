function disk

end

function disk.eject
    if sudo.validate -a arg.one $argv
        sudo diskutil unmount "/Volumes/$argv[1]"
    end
end
