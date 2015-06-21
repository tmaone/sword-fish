function select
  if arg $argv
    if array.contains found $argv[1]
      echo selecting $argv[1]
    end
      # if set -q $argv
      # array.print $argv
    # end
  end
end
