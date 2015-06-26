find.program ps

function ps
  call $ps $argv
end

function ps.top
  switch (os)
    case darwin
      call $ps -eo pcpu,pid,user,args | sed 1d | sort -r -k 1 | head -10
    case linux
      call $ps -eo pcpu,pid,user,args | sed 1d | sort -r -k 1 | head -10
    case syno
      call $ps ; echo "fix this"
    case '*'
      out.ln "not supported"
  end
end
