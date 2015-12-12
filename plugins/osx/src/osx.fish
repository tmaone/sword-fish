function osx.power
  set -l max (ioreg -l | fgrep MaxCapacity | cut -d= -f2 | tr -d " ");
  set -l cur (ioreg -l | fgrep CurrentCapacity | cut -d= -f2 | tr -d " ");
  set -l battery (awk -v "a=$max" -v "b=$cur" 'BEGIN{printf("%.2f%%", b/a * 100)}');
  out (color lightskyblue)"$battery"(color normal)
end

function osx.airport
    if sudo.validate
        if test -x /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
            sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport $argv
        else
            error "airport utility not found"
        end
    else
        error "needs sudo privileges"
    end
end

function osx.airportd
    if sudo.validate
        if test -x /usr/libexec/airportd
            sudo /usr/libexec/airportd $argv
        else
            error "airportd utility not found"
        end
    else
      error "needs sudo privileges"
    end
end

function osx.maintain
    sudo.validate
    info Executing Periodic Scripts
    info (osx.periodic | progress)
    info "Flushing home logs [$HOME/library/Logs/*/] [$HOME/library/Logs/*]"
    info (call $rm -rfv $HOME/library/Logs/*/ | progress)
    info (call $rm -rfv $HOME/library/Logs/* | progress)
    info "Flushing Safari downloads list [$HOME/library/Safari/Downloads.plist]"
    info (call $rm -rfv $HOME/library/Safari/Downloads.plist | progress)
    info "Emptying library & System caches [~/library/Caches/*] [/Library/Caches/*]"
    info (call $rm -rfv ~/library/Caches/* | progress)
    info (call $sudo $rm -rfv /Library/Caches/* | progress)
    info "Flushing DNS"
    info (call $dscacheutil -flushcache | progress)
    info "Flushing LaunchServices Database"
    info (call /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user | progress)
    info "Verifying disk"
    call $sudo $diskutil verifyVolume /
    info "Repairing disk permissions"
    call $sudo $diskutil repairPermissions /
    info "Purging memory"
    info (call $sudo $purge | progress)
end

function osx.periodic
    if sudo.validate
        call $sudo $periodic daily weekly monthly
        return 0
    else
      return 1
    end
end

function osx.update
  if sudo.validate
    call $sudo $softwareupdate -iav
  else
    error "needs sudo persmission"
  end
end

function osx.sleep
    call $osascript -e 'tell application "System Events" to sleep'
end
#
function osx.logout
  call $osascript -e 'tell application "System Events" to log out'
end

function osx.restart
    # if sudo.validate
    #     sudo shutdown -r now
    # end
    call $osascript -e 'tell application "System Events" to restart'
end

function osx.shutdown
    # if sudo.validate
    #     sudo shutdown -h now
    # end
    call $osascript -e 'tell application "System Events" to shut down'
end

function osx.log
    call $tail -f /var/log/system.log
end

function osx.java-config
    # debug "Java Home is:" (/usr/libexec/java_home)
    set -xU JAVA_HOME (/usr/libexec/java_home)
end


function osx.battery.percent
  call $defaults read com.apple.menuextra.battery ShowPercent
end

function osx.battery.percent.on
  call $defaults write com.apple.menuextra.battery ShowPercent -string "YES"
end

function osx.battery.percent.off
  call $defaults write com.apple.menuextra.battery ShowPercent -string "NO"
end

function osx.trackpad.right-click
  osx.defaults.write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
  osx.defaults.write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  osx.defaults.write.currenthost NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
  osx.defaults.write.currenthost NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
end

function osx.trackpad.tap-click
  osx.defaults.write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  osx.defaults.write.currenthost NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  osx.defaults.write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
end


function osx.autocorrect.on
  osx.defaults.write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
end


function osx.autocorrect.off
  osx.defaults.write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
end


function osx.library.show
  call $chflags nohidden "~/library"
end

function osx.library.hide
  call $chflags hidden "~/library"
end

function osx.key.repeat.on
  osx.defaults.write -g ApplePressAndHoldEnabled -bool true
end

function osx.key.repeat.off
  osx.defaults.write -g ApplePressAndHoldEnabled -bool false
end

function osx.natural-scroll.on
     osx.defaults.write NSGlobalDomain com.apple.swipescrolldirection -bool true
end

function osx.natural-scroll.off
    osx.defaults.write NSGlobalDomain com.apple.swipescrolldirection -bool false
end

function osx.snap-to-grid
  # Enable snap-to-grid for icons on the desktop and in other icon views
call $PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/library/Preferences/com.apple.finder.plist
call $PlistBuddy -c  "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/library/Preferences/com.apple.finder.plist
call $PlistBuddy -c  "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/library/Preferences/com.apple.finder.plist
end

function osx.computer-name
  call $scutil --get ComputerName
end

function download.web
  # require webarchiver
  find.program webarchiver
  if not test -z "webarchiver"
    set -l domain (host.domain "$argv")
    call $webarchiver -url $argv -output $domain.webarchive
  else

  end
end

function osx.ldapmode
  set -l ldapmode (call $grep LDAPv3 (call "$dscl" localhost -list / | psub ))
  if test "$ldapmode" = "LDAPv3"
    printf 'ldap'
  else
    printf 'local'
  end
end

function osx.ldapnode

  set localnode "."
  set ldapnode "/LDAPv3/127.0.0.1"

  set -l mode (osx.ldapmode)

  if test "$mode" = "ldap"
    printf '%s' (echo $ldapnode)
  else
    printf '%s' (echo $localnode)
  end

end

function osx.diradmin
 set -l mode (osx.ldapmode)
 if test $mode = "ldap"
    echo "diradmin"
  else
    echo $USER
  end
end

function osx.battery
  pmset -g batt
end
#   SETTINGS
#      displaysleep - display sleep timer; replaces 'dim' argument in 10.4 (value in minutes, or 0 to disable)
#      disksleep - disk spindown timer; replaces 'spindown' argument in 10.4 (value in minutes, or 0 to disable)
#      sleep - system sleep timer (value in minutes, or 0 to disable)
#      womp - wake on ethernet magic packet (value = 0/1). Same as "Wake for network access" in the Energy Saver preferences.
#      ring - wake on modem ring (value = 0/1)
#      powernap - enable/disable Power Nap on supported machines (value = 0/1)
#      autorestart - automatic restart on power loss (value = 0/1)
#      lidwake - wake the machine when the laptop lid (or clamshell) is opened (value = 0/1)
#      acwake - wake the machine when power source (AC/battery) is changed (value = 0/1)
#      lessbright - slightly turn down display brightness when switching to this power source (value = 0/1)
#      halfdim - display sleep will use an intermediate half-brightness state between full brightness and fully off  (value = 0/1)
#      sms - use Sudden Motion Sensor to park disk heads on sudden changes in G force (value = 0/1)
#      hibernatemode - change hibernation mode. Please use caution. (value = integer)
#      hibernatefile - change hibernation image file location. Image may only be located on the root volume. Please use caution. (value = path)
#      ttyskeepawake - prevent idle system sleep when any tty (e.g. remote login session) is 'active'. A tty is 'inactive' only when its idle time exceeds the system sleep timer. (value = 0/1)
#      networkoversleep - this setting affects how OS X networking presents shared network services during system sleep. This setting is not used by all platforms; changing its value is unsupported.
#      destroyfvkeyonstandby - Destroy File Vault Key when going to standby mode. By default File vault keys are retained even when system goes to standby. If the keys are destroyed, user will be prompted to enter the password while coming out of standby mode.(value: 1 - Destroy, 0 -
#      Retain)
#
# GETTING
#      -g (with no argument) will display the settings currently in use.
#      -g live displays the settings currently in use.
#      -g custom displays custom settings for all power sources.
#      -g cap displays which power management features the machine supports.
#      -g sched displays scheduled startup/wake and shutdown/sleep events.
#      -g ups displays UPS emergency thresholds.
#      -g ps / batt displays status of batteries and UPSs.
#      -g pslog displays an ongoing log of power source (battery and UPS) state.
#      -g rawlog displays an ongoing log of battery state as read directly from battery.
#      -g therm shows thermal conditions that affect CPU speed. Not available on all platforms.
#      -g thermlog shows a log of thermal notifications that affect CPU speed. Not available on all platforms.
#      -g assertions displays a summary of power assertions. Assertions may prevent system sleep or display sleep. Available 10.6 and later.
#      -g assertionslog shows a log of assertion creations and releases. Available 10.6 and later.
#      -g sysload displays the "system load advisory" - a summary of system activity available from the IOGetSystemLoadAdvisory API. Available 10.6 and later.
#      -g sysloadlog displays an ongoing log of lives changes to the system load advisory. Available 10.6 and later.
#      -g ac / adapter will display details about an attached AC power adapter. Only supported for MacBook and MacBook Pro.
#      -g log displays a history of sleeps, wakes, and other power management events. This log is for admin & debugging purposes.
#      -g uuid displays the currently active sleep/wake UUID; used within OS X to correlate sleep/wake activity within one sleep cycle.  history
#      -g uuidlog displays the currently active sleep/wake UUID, and prints a new UUID as they're set by the system.
#      -g history is a debugging tool. Prints a timeline of system sleeplwake UUIDs, when enabled with boot-arg io=0x3000000.
#      -g historydetailed Prints driver-level timings for a sleep/wake. Pass a UUID as an argument.
#      -g powerstate [class names] Prints the current power states for I/O Kit drivers. Caller may provide one or more I/O Kit class names (separated by spaces) as an argument. If no classes are provided, it will print all drivers' power states.
#      -g powerstatelog [-i interval] [class names] Periodically prints the power state residency times for some drivers. Caller may provide one or more I/O Kit class names (separated by spaces). If no classes are provided, it will log the IOPower plane's root registry entry. Caller
#      may specify a polling interval, in seconds with -i <polling interval>; otherwise it defaults to 5 seconds.
#      -g stats Prints the counts for number sleeps and wakes system has gone thru since boot.
#      -g systemstate Prints the current power state of the system and available capabilites.
#      -g everything Prints output from every argument under the GETTING header. This is useful for quickly collecting all the output that pmset provides. Available in 10.8.


function osx.diradmin.password
  set -l searchnode "/Search"
  set -l diradmin (get.diradmin)
  if [ "$diradminpasswd" = "" ]
  log.info "Please enter password for $diradmin (enter break to stop)"
  set good "no"
  while [ $good = "no" ]
    read -l -p prompt.passwd diradminpasswd
    if test $diradminpasswd = "break"
      set good "exit"
      break
    end
    set passwdok (call $grep failed (call $dscl $searchnode -authonly $diradmin $diradminpasswd | psub ) )
    if [ "$passwdok" = "" ]
      set good "yes"
      # echo $diradminpasswd
      set -g diradminpasswd $diradminpasswd
    else
      log.error "Password failed, try again"
    end
  end
  end
end

function osx.gatekeeper.disable
    call $defaults write /Library/Preferences/com.apple.security GKAutoRearm -bool NO
end
