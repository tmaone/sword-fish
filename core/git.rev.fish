function git.rev
  if arg.one $argv
    if git.is $argv[1]
      set -l git_revision (call $git --git-dir="$argv[1]/.git" --work-tree="$argv[1]" rev-parse --short HEAD)
      out $git_revision
    end
  else
    if git.is (pwd)
      set -l git_revision (call $git --git-dir=(pwd)"/.git" --work-tree=(pwd) rev-parse --short HEAD)
      out $git_revision
    end
  end
end
