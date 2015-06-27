if not var.exists out
  out.init
end

function out

  if arg $argv
    call $out "%s" "$argv"
  end

end

function out.mute
  # nohup $argv[1] &>/dev/null &
end


# printf "\033[6;3HHello\n"
