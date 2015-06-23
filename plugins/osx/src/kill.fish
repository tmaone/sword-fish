function osx.kill.dock
  call $killall -HUP "Dock" > /dev/null 2>&1
end

function osx.kill.finder
  call $killall -HUP "Finder" > /dev/null 2>&1
end

function osx.kill.calendar
  call $killall -HUP "Calendar" > /dev/null 2>&1
end

function osx.kill.contacts
  call $killall -HUP "Contacts" > /dev/null 2>&1
end

function osx.kill.itunes
  call $killall -HUP "iTunes" > /dev/null 2>&1
end

function osx.kill.mail
  call $killall -HUP "Mail" > /dev/null 2>&1
end

function osx.kill.safari
  call $killall -HUP "Safari" > /dev/null 2>&1
end

function osx.kill.windowserver
  call $killall -HUP "WindowServer" > /dev/null 2>&1
end
