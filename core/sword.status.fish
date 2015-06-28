function sword.status
  var.global sword_status (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status --porcelain)
  if test -z "$sword_status"
    return 0
  else
    array.print sword_status
    return 1
  end
end
