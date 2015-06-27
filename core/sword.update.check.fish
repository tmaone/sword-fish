function sword.update.check

  set -l ahead (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status | grep ahead | count.lines)

  if test "$ahead" -gt 0
    debug "sword-fish is ahead of remote"
    var.global sword_update_available false
    return 1
  end

  if string.equals (sword.version.git) (sword.version.remote)
      debug "sword-fish is in sync with remote"
      var.global sword_update_available false
      return 1
  else
      debug "sword-fish has updates"
      var.global sword_update_available true
      return 0
  end
end
