function array

end

function array.init

end

function array.size
  if arg.one $argv
    if set -q $argv[1]
      out (count $$argv[1])
    end
  end
end

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

function array.print
  if arg $argv
      if set -q $argv
        for item in $$argv
         out "$item "
        end
      end
  end
end

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

function array.contains
  if arg.two $argv
    if set -q $argv[1]
      if contains $argv[2] $$argv[1]
        return 0
      else
        return 1
      end
    end
  else
    return 1
  end
end
