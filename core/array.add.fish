function array.add
  if arg.two $argv
    if set -q $argv[1]
      if not contains $argv[2] $$argv[1]
        set -xg $argv[1] $$argv[1] $argv[2]
      end
    else
      set -xg $argv[1] $argv[2]
    end
  end
end
