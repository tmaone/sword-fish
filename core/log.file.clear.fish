function log.file.clear
  if file.exists "$sword_log_file"
    echo "" > "$sword_log_file"
    return 0
  else
    return 1
  end
end
