
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
