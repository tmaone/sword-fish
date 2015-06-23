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
