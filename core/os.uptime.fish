function os.uptime
  set -l up (uptime | grep -ohe 'up .*' | sed 's/,//g' | awk '{ print $2 }')
  set -l days (uptime | grep -ohe 'up .*' | sed 's/,//g' | awk '{ print $3 }')
  if string.contains $days days
      out $up $days
  else
      out $up
  end
end
