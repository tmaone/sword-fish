find.program ps

function ps
  call $ps $argv
end

function ps.top
  call $ps -eo pcpu,pid,user,args | sed 1d | sort -r -k 1 | head -10
end
