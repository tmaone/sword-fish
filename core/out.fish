function out
  if arg $argv
    echo -n -e $argv
  end
end

function out.ln
  if arg $argv
    echo $argv
  end
end


function out.mute
  # nohup $argv[1] &>/dev/null &
end


# printf "\033[6;3HHello\n"
