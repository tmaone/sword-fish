import find log

# find.program sed > /dev/null
# find.program grep > /dev/null
# find.program awk > /dev/null

function setting

end

function setting.get
  set -l settingfile $argv[1]
  set -l settingname $argv[2]

  # log.debug "Settings file is: $settingfile"
  # log.debug "Settings name is: $settingname"
  # call $sed -n "s/^$argv[2]=\(.*$\)/\1/p" "$argv[1]"
  # sed -n -e 's/^.*stalled: //p'
  set -l result (call $sed -n -e 's/^'$settingname'=//p' "$settingfile")
  # echo $result
  # echo (count $result)
  if test (count $result) = 0
    # echo ""
    # log.error "Setting \"$settingname\" not found in \"$settingfile\""
    return 1
  else
    echo $result
    return 0;
  end
end

function setting.set
  set -l settingfile "$argv[1]"
  set -l settingname "$argv[2]"
  set -l setting "$argv[3]"

  set -l result (setting.get "$settingfile" "$settingname")
  # log.debug "$result"

  if test -z $result
    log.debug "Setting $settingname does not exist in $settingfile, appending."
    echo "$settingname=$setting" >> $settingfile
    # call $sed -i 's^.*'$settingname' ' //p'
        # set -l result (call $sed -n -e 's/^.*'$settingname' //p' "$settingfile" | tr -d "\"")
# sed "s/aaa=.*/aaa=xxx/g"
  else
    set -l searchstring "$settingname="
    set -l replacestring "$settingname=$setting"
    if [ "$result" = "$setting" ]
      log.debug "Setting $settingname in $settingfile is already $setting."
    else
    log.debug "Setting $settingname exists in $settingfile, inline replace."
     # echo sed "s@$searchstring.*@$replacestring@g\n$settingfile"
     call $sed -i '' "s@$searchstring.*@$replacestring@g" "$settingfile"
    end

    # cat "$settingfile"

    # set -l origstr "set -g $settingname"
    # set -l finalstr "set -g $settingname $setting"
    # echo call $awk -F= "{$settingname=$setting;print}" OFS="\=" "$settingfile"
  # sed "s/mysqlpasswd/$_gitlab_mysql_passwd/g" $_server/services/gitlab/database.yml.mysql > $_gitlab_path/config/database.yml

    # call echo $sed -i 's/^'$settingname'=.*/'$settingname'='$setting'/g' "$settingfile"
    # echo call $sed -i \""s@$settingname\=.*@/$settingname=$setting@g\"\n$settingfile"
    # call $sed -i \""s@$settingname\=.*@/$settingname=$setting@g\"\n$settingfile"
    # awk -F= '{$2="xxx";print}' OFS="\=" filename
    # call echo $sed -i \'s/^set -g \'$settingname\'*/set -g \'$settingname\' \'$setting\'/g\' "$settingfile"
  end
# setting.get
 #  if grep -sq "^${SETTING_NAME}=" $MAIN_FOLDER/testsettings.ini
 #  then
 #    sed -i "s/^${SETTING_NAME}=.*$/$1/" $MAIN_FOLDER/testsettings.ini
 #  else
 #    echo "$1" >> $MAIN_FOLDER/testsettings.ini
 #  fi
 #  return

    # call $sed -i 's/$argv[2]/beautiful/g' "$argv[1]"
end
