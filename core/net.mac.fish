function net.mac
  call $ifconfig -a | awk '/ether/ {print $2}' ;
end
