function array.get

  if arg.two $argv

    if set -q $argv[1]
      # debug $argv[1]
      if contains $argv[2] $$argv[1]
        set -l idx (contains --index $argv[2] $$argv[1])
        # debug $idx
        out $idx
        return 0
      end

      if set -q $argv[1][$argv[2]]
        out $$argv[1][$argv[2]]
        return 0
      end

      return 1
    end

    return 1
  end

end
