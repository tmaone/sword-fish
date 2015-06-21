function osx.power
  set -l max (ioreg -l | fgrep MaxCapacity | cut -d= -f2 | tr -d " ");
  set -l cur (ioreg -l | fgrep CurrentCapacity | cut -d= -f2 | tr -d " ");
  set battery (awk -v "a=$max" -v "b=$cur" 'BEGIN{printf("%.2f%%", b/a * 100)}');
  out (color lightskyblue)"$battery"(color normal)
end

# function net.airport
#     if sudo.validate
#         if test -x /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
#             sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport $argv
#         else
#             log.error "airport utility not found"
#         end
#     else
#         log.error net.airport needs sudo privileges
#     end
# end
#
# function net.airportd
#     if sudo.validate
#         if test -x /usr/libexec/airportd
#             sudo /usr/libexec/airportd $argv
#         else
#             log.error "airportd utility not found"
#         end
#     else
#         log.error net.airportd needs sudo privileges
#     end
# end

#
# import sudo log
#
# function os
#
# end
#
# function os.clean
#     sudo.validate
#     log.info  Executing Periodic Scripts..
#     os.periodic
#     log.info Flushing home logs..
#     rm -rfv $HOME/library/Logs/*/
#     rm -rfv $HOME/library/Logs/*
#     log.info Flushing Safari downloads list..
#     rm -rfv $HOME/library/Safari/Downloads.plist
#     log.info Emptying library caches..
#     rm -rfv ~/library/Caches/*
#     log.info Flushing DNS..
#     dscacheutil -flushcache
#     log.info Emptying System caches..
#     sudo rm -rfv /Library/Caches/*
#     log.info Flushing LaunchServices Database..
#     /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
#     log.info Repairing disk permissions..
#     sudo diskutil repairPermissions /
#     sudo purge
# end
#
# function os.update
#     sudo.validate
#     sudo softwareupdate -iav
#     sudo.invalidate
#     brew update -vvv
#     brew upgrade -vvv
#     fish.update
#     sword.update
# end
#
# function os.sleep
#     osascript -e 'tell application "System Events" to sleep'
# end
#
# function os.logout
#     osascript -e 'tell application "System Events" to log out'
# end
#
# function os.restart
#     # if sudo.validate
#     #     sudo shutdown -r now
#     # end
#     osascript -e 'tell application "System Events" to restart'
# end
#
# function os.shutdown
#     # if sudo.validate
#     #     sudo shutdown -h now
#     # end
#     osascript -e 'tell application "System Events" to shut down'
# end
#
# function os.periodic
#     if sudo.validate
#         sudo /usr/sbin/periodic daily weekly monthly
#     end
# end
#
# function os.log
#     tail -f /var/log/system.log
# end
#
# function os.java_config
#     log.debug "Java Home is:" (/usr/libexec/java_home)
#     set -xU JAVA_HOME (/usr/libexec/java_home)
# end


# import arg sudo
#
# function osx --description 'Evaluates the command if the current OS is MacOS'
#     if set -q OS
#         if test $OS = "darwin"
#             if arg.has_args $argv
#                 eval $argv
#             end
#             return 0
#         else
#             return 1
#         end
#     else
#         return 1
#     end
# end
#
# function osx.reset_launchpad
#     echo not working in yosemite
#     # if not test -z (ls ~/library/Application\ Support/Dock/*.db 2> /dev/null)
#     #     echo deleting
#     #     rm -v ~/library/Application\ Support/Dock/*.db
#     # else
#     # echo nothing to delete
#     # end
#     # kill.dock
# end

# TODO perhaps integrate with lunchy (ls, etc)
#
# set -xg osx_launchd_path "/Library/LaunchDaemons/"
#
# function osx.launchd.load
#     sudo.validate
#     sudo launchctl load -w $osx_launchd_path/$argv
# end
#
# function osx.launchd.unload
#     sudo.validate
#     sudo launchctl unload -w $osx_launchd_path/$argv
# end
#
# function osx.launchd.start
#     sudo.validate
#     sudo launchctl start $osx_launchd_path/$argv
# end
#
# function osx.launchd.stop
#     sudo.validate
#     sudo launchctl stop $osx_launchd_path/$argv
# end
#
# function osx.launchd
#     # echo $argv
#     if arg.two $argv
#         # echo two
#         switch $argv[1];
#           case "load"
#             osx.launchd.load $argv[2]
#           case 'unload'
#             osx.launchd.unload $argv[2]
#           case 'start'
#             osx.launchd.start $argv[2]
#           case 'stop'
#             osx.launchd.stop $argv[2]
#           case '*';
#             # commands;
#         end
#     end
# end
#
# function osx.kill.dock
#     killall -HUP "Dock" > /dev/null 2>&1
# end
#
# function osx.kill.finder
#     killall -HUP "Finder" > /dev/null 2>&1
# end
