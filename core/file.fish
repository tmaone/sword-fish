function file.init
  find.program file
end

function file
  if arg $argv
    call $file $argv
  end
end
