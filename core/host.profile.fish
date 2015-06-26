function host.profile
  var.global HOST (file.base (host.name))
  var.global HOST_NAME (host.name)
  var.global HOST_EXT (host.extension (host.name))
  debug "host.profile [$HOST_NAME] [$HOST] [$HOST_EXT]"
end
