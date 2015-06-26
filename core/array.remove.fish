function array.remove
  if arg.two $argv
    if set -q $argv[1]
      if contains $argv[2] $$argv[1]
        set -l idx (contains --index $argv[2] $$argv[1])
        set -e $argv[1][$idx]
      end
    end
  end
end
