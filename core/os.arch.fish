if test -z $uname
  os.init
end

function os.arch
  out (call $uname -m)
end
