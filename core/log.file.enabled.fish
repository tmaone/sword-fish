function log.file.enabled
  if set -q log_to_file
    return 0
  else
    return 1
  end
end
