function update.init
  if not set -q update_available
    var.global update_available false
  end
  if not set -q update_chance
    var.global update_chance 50
  end
end

function update.check
  set -l version_local_git (sword.version.git)
  set -l version_remote_git ''
  if net.connected
        set version_remote_git (git --git-dir="$sword_root/.git" --work-tree="$sword_root" ls-remote origin HEAD | grep HEAD | cut -c 1-7)
  else
      set version_remote_git (sword.version.git)
  end
  if string.equals "$version_local_git" "$version_remote_git"
      return 1
  else
      return 0
  end
end

function update

  # if test (math (random)%100) -ge (math 100 - $update_chance)
  if update.check
    var.global update_available true
  end
  # end

  if test $update_available = true
    call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" pull
    reload
    var.global update_available false
  end

end

# function update.
#     if sword.check_update
#         call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" pull
#         reload
#     end
# end
# if set -q update_count
#   if test $update_count -ge $update_lim
#       var.global update_count (math $update_lim + 10)
#   else
#       set -xU update_count (math $update_count + 1)
#   end
# else
#   set -xU update_count 1
#   sword.update
# end
