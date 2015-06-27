function sword.update.check

  set -l ahead (git --git-dir="$sword_root/.git" --work-tree="$sword_root" status | grep ahead | count.lines)

  if test "$ahead" -gt 0
    debug "sword-fish is ahead of remote"
    return 1
  end

  if string.equals (sword.version.git) (sword.version.remote)
      return 1
  else
      return 0
  end
end
