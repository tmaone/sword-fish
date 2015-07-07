function sword.greeting

  if not functions -q fish_greeting

    function fish_greeting
      set -l info_line (printf "%s%s %s %s %s %s %s%s" (set_color $fish_color_autosuggestion[1]) (host.name) (os) (os.kernel) (os.arch) (user.who) (os.uptime) (set_color normal))
      out.ln $info_line
      sword.logo
    end

  end

end
