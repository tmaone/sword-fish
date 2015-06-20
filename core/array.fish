function array

end

function array.init

end

function array.size

end

function array.add
  if arg.two $argv
    if set -q $argv[2]
      if not contains $argv[1] $$argv[2]
        set -xg $argv[2] $$argv[2] $argv[1]
      end
    else
      set -xg $argv[2] $argv[1]
    end
  end

  #   set -l element "$argv[1]"
  #   set -l array $$argv[2]

  #
  # end
end

function array.remove
  if arg.two $argv
    set -l element "$argv[1]"
    set -l array $$argv[2]
    if contains $element $array
      set -l idx (contains --index $element $array)
      set -e $$argv[2][$idx]
    end
  end
end

function array.print

end

function array.add

end

function array.get

end

function array.contains

end
