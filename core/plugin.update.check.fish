function plugin.update.check

  if arg.one $argv

    if git.is "$sword_plugin_root/$argv"

      if net.connected

        set -l local (git.rev "$sword_plugin_root/$argv")
        set -l remote (call $git --git-dir="$sword_plugin_root/$argv/.git" --work-tree="$sword_plugin_root/$argv" ls-remote origin HEAD | grep HEAD | cut -c 1-7)

        if string.equals $local $remote
          debug "plugin.update.check: $argv is updated ($local)"
          var.global sword_update_available false
          return 1
        else
          debug "plugin.update.check: $argv has updates ($local) to ($remote)"
          return 0
        end

      else
        return
      end

    else
      return 1
    end
  else
    return 1
  end

end
