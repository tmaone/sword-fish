if test -z $uname -o -z $sed
  os.init
end

function os

  set -l current_os (call $uname -s | call $sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/')

  set -l synology (call $uname -a | grep -i 'synology')

  if test -z $synology
    out "$current_os"
  else
    out "syno"
  end

end
