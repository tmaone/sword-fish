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
