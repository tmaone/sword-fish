function log.init

  if not set -q log_filename
    set -xg log_filename  'sword-fish.log'
  end

  if not set -q log_path
    set -xg log_path $sword_root/log
    if not test -d $log_path
      mkdir -p $log_path
    end
  end

  if not set -q sword_log_file
    set -xg sword_log_file $log_path/$log_filename
    if not test -f $sword_log_file
      touch $sword_log_file
    end
  end

  if not set -q log_level
    set -xU log_level info
  end

end
