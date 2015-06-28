function sword.version.git
        if git.is $sword_root
            set -l sword_version_git (call $git --git-dir="$sword_root/.git" --work-tree="$sword_root" rev-parse --short HEAD)
            out $sword_version_git
        end
end
