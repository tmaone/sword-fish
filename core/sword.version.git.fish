function sword.version.git
        if git.is $sword_root
            pwd.save
            cd $sword_root
            set -l sword_version_git (git rev-parse --short HEAD)
            out $sword_version_git
            pwd.cd
        end
end
