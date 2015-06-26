function array.print
  if arg $argv
      if set -q $argv
        for item in $$argv
         out "$item "
        end
      end
  end
end
