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
    call $sudo $launchctl start $osx_launchd_path/$argv.plist
  else

  end
  else
    error "needs sudo rights"
  end
end

function osx.launchd.stop
if sudo.validate
  if arg $argv
    call $sudo $launchctl stop $osx_launchd_path/$argv.plist
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
