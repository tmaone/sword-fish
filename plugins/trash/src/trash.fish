function trash
  if not test -z $trash
     call $trash $argv
  end
end

function trash.empty
  if not test -z $trash
    call $trash -e
  end
end

function trash.list
  if not test -z $trash
    call $trash -l
  end
end

function trash.update
  if not test -z $trash
    call $trash -u
  end
end
