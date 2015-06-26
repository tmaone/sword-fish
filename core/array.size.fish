function array.size
  if arg.one $argv
    if set -q $argv[1]
      out (count $$argv[1])
    end
  end
end
