function core.init

    if status --is-interactive
    echo interactive
    # set -e __fish_prompt_cwd
    # commandline -f repaint ^/dev/null
    end

    if status --is-login
    echo login
    # set -e __fish_prompt_cwd
    # commandline -f repaint ^/dev/null
    end

    debug "sword-fish root [$sword_root]"

    var.global init_functions (fn.list | grep ".init")
    var.remove init_functions "core.init"

    for init_function in $init_functions
      call "$init_function"
      debug "core.init: $init_function"
    end

    profile

    function fish_greeting

      set -l info_line (printf "%s%s %s %s %s%s" (set_color $fish_color_autosuggestion[1]) (host.name) (os) (os.kernel) (os.arch)(set_color normal))

      out.ln $info_line

      sword.logo

      set -l line1 (printf (_ 'Welcome to fish, the friendly interactive shell') )
      set -l line2 (printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
      out.ln "$line1"
      out.ln "$line2"

    end

    # plugin.load

    # prompt.load

    # theme.load

    # color.personal

    if file.exists "$sword_root/config/default.sword-fish"
        builtin source "$sword_root/config/default.sword-fish"
    end

    if sword.update.check.chance
      info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
    end

    var.global core_init "done"

end
