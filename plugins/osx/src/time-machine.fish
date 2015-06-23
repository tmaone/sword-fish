
function osx.time-machine.on
  call $sudo $tmutil enable;
end

function osx.time-machine.off
  call $sudo $tmutil disable;
end

function osx.time-machine.enable-local
  call $sudo $tmutil enablelocal
end

function osx.time-machine.disable-local
  call $sudo $tmutil disablelocal;
end

function osx.time-machine.list
  call $sudo $tmutil listbackups;
end

function osx.time-machine.start
  call $sudo $tmutil startbackup;
end

function osx.time-machine.stop
  call $sudo $tmutil stopbackup;
end

function osx.time-machine.exclude
  call $sudo $tmutil addexclusion $argv;
end
