function fish.init
  find.program fish
end

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

# function fish.version.git
#         printf "%s" (git --git-dir="$sword_root/fish/.git" --work-tree="$sword_root/fish" rev-parse --short HEAD)
# end

function fish --description 'The user-friendly command line shell.'
  if arg $argv
    call $fish $argv
  else
    call $fish
  end
end
