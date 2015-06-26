function host.init
  find.program host
  find.program hostname
  find.program sudo
end

function _host_profile --on-event profile
  host.profile
end

function _host_profile_print --on-event profile_print
  host.profile.print
end
