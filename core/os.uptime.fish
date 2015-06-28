function os.uptime
  out (uptime | grep -ohe 'up .*' | sed 's/,//g' | awk '{ print $2" "$3 }')
end

# UPTIME: ( 5 days, 19:12:41 )
# upsecs=$(cat /proc/uptime | cut -d ' ' -f1); echo "$((`echo $upsecs | cut -d '.' -f1` (60*60*24))) days, $(date -d "`echo @$upsecs`" +%H:%M:%S)"
