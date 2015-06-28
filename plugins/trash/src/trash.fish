function trash
     call $trash $argv
end

function trash.empty
    call $trash -e
end

function trash.list
    call $trash -l
end

function trash.update
    call $trash -u
end
