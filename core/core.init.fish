function core.init

  if not var.done core_init

    var.global core_init_functions (fn.list | grep ".init")
    var.remove core_init_functions "core.init"

    for init_function in $core_init_functions
      debug "core.init: $init_function"
      eval $init_function
    end

    profile

    color.personalize

    theme.load

    prompt.load

    plugin.load

    sword.greeting

    if file.exists "$sword_root/config/default.sword-fish"
      builtin source "$sword_root/config/default.sword-fish"
    end

    function on_exit --on-process %self
        out.ln 'bye.'
    end

    if sword.update.check.chance
      info "sword+fish update available... " (color tomato)"("(color darkorange)(sword.version.git)(color tomato)")"(color normal)"~>"(color palegreen)"("(color aqua)(sword.version.remote)(color palegreen)")"(color normal)
    end

    var.global core_init done

  end

end
