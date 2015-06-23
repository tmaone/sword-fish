function osx.power
  set -l max (ioreg -l | fgrep MaxCapacity | cut -d= -f2 | tr -d \n);
  set -l cur (ioreg -l | fgrep CurrentCapacity | cut -d= -f2 | tr -d \n);
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


function osx.kill.dock
  call $killall -HUP "Dock" > /dev/null 2>&1
end

function osx.kill.finder
  call $killall -HUP "Finder" > /dev/null 2>&1
end

function osx.kill.calendar
  call $killall -HUP "Calendar" > /dev/null 2>&1
end

function osx.kill.contacts
  call $killall -HUP "Contacts" > /dev/null 2>&1
end

function osx.kill.itunes
  call $killall -HUP "iTunes" > /dev/null 2>&1
end

function osx.kill.mail
  call $killall -HUP "Mail" > /dev/null 2>&1
end

function osx.kill.safari
  call $killall -HUP "Safari" > /dev/null 2>&1
end

function osx.kill.windowserver
  call $killall -HUP "WindowServer" > /dev/null 2>&1
end

# TODO perhaps integrate with lunchy (ls, etc)

set -xg osx_launchd_path "/Library/LaunchDaemons/"

function osx.launchd.load
    if sudo.validate
      if arg $argv
        call $sudo $launchctl load -w $osx_launchd_path/$argv.plist
      else

      end
    else
      error "needs sudo rights"
    end
end

function osx.launchd.unload
if sudo.validate
  if arg $argv
    call $sudo $launchctl unload -w $osx_launchd_path/$argv.plist
  else

  end
  else
    error "needs sudo rights"
  end
end

function osx.launchd.start
if sudo.validate
  if arg $argv
    call $sudo $launchctl start $osx_launchd_path/$argv
  else

  end
  else
    error "needs sudo rights"
  end
end

function osx.launchd.stop
if sudo.validate
  if arg $argv
    call $sudo $launchctl stop $osx_launchd_path/$argv
  else

  end
  else
    error "needs sudo rights"
  end
end

function osx.launchd.list
  if dir.exists $osx_launchd_path
    set -l launchd_list (ls $osx_launchd_path)
    out.ln $launchd_list
  end
end

function osx.launchd
    # echo $argv
    if arg.two $argv
        # echo two
        switch $argv[1];
          case "load"
            osx.launchd.load $argv[2]
          case 'unload'
            osx.launchd.unload $argv[2]
          case 'start'
            osx.launchd.start $argv[2]
          case 'stop'
            osx.launchd.stop $argv[2]
          case '*';
            # commands;
        end
    else
      if arg.one $argv
      switch $argv[1];
        case "list"
          osx.launchd.list
        case '*';
          # commands;
      end
      end
    end

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

function osx.safari.clean-previews
  call $rm -rfv $HOME/Library/Caches/com.apple.Safari/Webpage\ Previews/*
end

function osx.safari.develop
  call $defaults write com.apple.Safari IncludeDevelopMenu -bool true
  call $defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  call $defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
end

function osx.safari.webgl.on
  osx.defaults.write com.apple.Safari WebKitWebGLEnabled -bool YES
end

function osx.safari.webgl.off
  osx.defaults.write com.apple.Safari WebKitWebGLEnabled -bool NO
end


function osx.calendar.develop
  call $defaults write com.apple.iCal IncludeDebugMenu -bool true
end

function osx.contacts.develop
  call $defaults write com.apple.addressbook ABShowDebugMenu -bool true
end

function osx.diskutil.develop
  call $defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
end

function osx.diskutil.disk-verification.on
  call $defaults write com.apple.frameworks.diskimages skip-verify -bool false
  call $defaults write com.apple.frameworks.diskimages skip-verify-locked -bool false
  call $defaults write com.apple.frameworks.diskimages skip-verify-remote -bool false
end

function osx.diskutil.disk-verification.off
  call $defaults write com.apple.frameworks.diskimages skip-verify -bool true
  call $defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
  call $defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
end

function osx.defaults
  call $defaults $argv
end

function osx.defaults.read
  call $defaults read $argv
end

function osx.defaults.write
  call $defaults write $argv
end

function osx.defaults.write.currenthost
  call $defaults -currentHost write $argv
end

function osx.dock.light.on
  osx.defaults.write com.apple.dock show-process-indicators -bool true
end

function osx.dock.light.off
  osx.defaults.write com.apple.dock show-process-indicators -bool false
end


function osx.autocorrect.on
  osx.defaults.write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true
end


function osx.autocorrect.off
  osx.defaults.write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
end

function osx.finder.extensions.on
  osx.defaults.write NSGlobalDomain AppleShowAllExtensions -bool true
end


function osx.finder.extensions.off
  osx.defaults.write NSGlobalDomain AppleShowAllExtensions -bool false
end


function osx.finder.fullpath.on
  osx.defaults.write com.apple.finder _FXShowPosixPathInTitle -bool true
end


function osx.finder.fullpath.off
  osx.defaults.write com.apple.finder _FXShowPosixPathInTitle -bool false
end


function osx.finder.quit.on
  osx.defaults.write com.apple.finder QuitMenuItem -bool true
end


function osx.finder.quit.off
  osx.defaults.write com.apple.finder QuitMenuItem -bool false
end

function osx.finder.statusbar.on
  osx.defaults.write com.apple.finder ShowStatusBar -bool true
end


function osx.finder.statusbar.off
  osx.defaults.write com.apple.finder ShowStatusBar -bool false
end

function osx.finder.show
  osx.defaults.write com.apple.finder AppleShowAllFiles TRUE
end

function osx.finder.hide
  osx.defaults.write com.apple.finder AppleShowAllFiles FALSE
end

function osx.finder.secure-empty.on
  osx.defaults.write com.apple.finder EmptyTrashSecurely -bool true
end

function osx.finder.secure-empty.off
  osx.defaults.write com.apple.finder EmptyTrashSecurely -bool false
end

function osx.finder.warn-empty.on
  osx.defaults.write com.apple.finder WarnOnEmptyTrash -bool true
end

function osx.finder.warn-empty.off
  osx.defaults.write com.apple.finder WarnOnEmptyTrash -bool false
end

function osx.finder.warn-extension.on
  osx.defaults.write com.apple.finder FXEnableExtensionChangeWarning -bool true
end

function osx.finder.warn-extension.off
  osx.defaults.write com.apple.finder FXEnableExtensionChangeWarning -bool false
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

function osx.dock.launch-animation.on
  osx.defaults.write com.apple.dock launchanim -bool true
end

function osx.dock.launch-animation.off
  osx.defaults.write com.apple.dock launchanim -bool false
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


function osx.time-machine.on
  call $sudo $tmutil enable;
end

function osx.time-machine.off
  call $sudo $tmutil disable;
end

function osx.time-machine.enable-local
  call $sudo $tmutil enablelocal
end

function osx.time-machine.disable-local
  call $sudo $tmutil disablelocal;
end

function osx.time-machine.list
  call $sudo $tmutil listbackups;
end

function osx.time-machine.start
  call $sudo $tmutil startbackup;
end

function osx.time-machine.stop
  call $sudo $tmutil stopbackup;
end

function osx.time-machine.exclude
  call $sudo $tmutil addexclusion $argv;
end

function osx.computer-name
  call $scutil --get ComputerName
end
