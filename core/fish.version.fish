function fish.version
    if set -q FISH_VERSION
      echo $FISH_VERSION
        # debug "fish.version: from variable"
        # printf "%s" $FISH_VERSION
    # else
        # debug "fish.version: from executable $fish"
        # printf "%s" (string.split (call $fish --version) ' ')
    end
end
