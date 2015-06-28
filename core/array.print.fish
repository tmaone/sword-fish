function array.print
  if arg.one $argv
      if set -q $argv[1]
        for item in $$argv[1]
         out.ln "$item"
        end
      end
  end
end
