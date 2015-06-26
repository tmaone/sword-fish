function sword.version
  if git.is $sword_root
    pwd.save
    cd $sword_root
    set -l sword_version (git describe --tags --always)
    out $sword_version
    pwd.cd
  end
end
