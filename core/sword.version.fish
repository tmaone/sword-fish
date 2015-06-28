function sword.version
  if git.is $sword_root
    set -l sword_version (call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" describe --tags --always)
    out $sword_version
  end
end
