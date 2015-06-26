if test -z $uname
  os.init
end

function os.kernel
  out (call $uname -r)
end
