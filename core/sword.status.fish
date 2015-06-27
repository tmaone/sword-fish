function sword.status
  set -l sword_status (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status --porcelain)
  if test -z "$sword_status"
    return 1
  else
    return 0
  end
end
