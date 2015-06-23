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
