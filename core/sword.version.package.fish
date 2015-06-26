function sword.version.package
    if test -f $sword_root/VERSION
        set -l sword_version_package (cat $sword_root/VERSION)
        out $sword_version_package
    end
end
