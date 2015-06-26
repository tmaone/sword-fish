if test -z $uname
  os.init
end

function os

  set -l os (call $uname -s | call $sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/')

  if not test -z (call $uname -a | grep -i 'synology')
    out syno
  else
    out $os
  end

end
