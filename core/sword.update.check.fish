function sword.update.check
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
