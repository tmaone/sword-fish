
function osx.net.online
  # until ping -W1 -c1 8.8.8.8; do sleep 5; done && say the internet is back
end

function osx.net.flushdns
  # dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say flushed
end

