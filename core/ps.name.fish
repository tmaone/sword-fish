function ps.name
  if arg $argv
  switch (os)
    case darwin
      call $ps -p $argv -o comm=
    case linux
      call $ps -p $argv -o comm=
    case syno
      cat /proc/$argv/comm
    case '*'
      out.ln "not supported"
  end
  end
end
