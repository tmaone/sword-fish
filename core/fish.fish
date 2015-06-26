function fish.init
  find.program fish
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
