function sword.update

  # if
  #   var.global update_available true
  # else
  #   return 0
  # end
  # end
  # if test (math (random)%100) -ge (math 100 - $update_chance)

  if sword.update.check
    set -l local (sword.version.git)
    set -l remote (sword.version.remote)
    info "Updating "(color darksalmon)$local(color normal)" to "(color darkseagreen)$remote(color normal)" ..."
    call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" pull --quiet
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
