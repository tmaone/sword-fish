function core.init

    var.global init_functions (fn.list | grep ".init")
    var.remove init_functions "core.init"

    for init_function in $init_functions
      call "$init_function"
      debug "core.init: $init_function"
    end

    debug "sword-fish root [$sword_root]"

    profile

    function fish_greeting
      # set_color $fish_color_autosuggestion[1]
      # printf "%s %s %s %s\n" (host.name) (os) (os.kernel) (os.arch)
      # set_color normal
      sword.logo
      set_color normal
      set -l line1 (printf (_ 'Welcome to fish, the friendly interactive shell') )
      set -l line2 (printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
      out.ln "$line1"
      out.ln "$line2"
    end


    # set -l line1 (printf (_ 'Welcome to fish, the friendly interactive shell') )
		# 	set -l line2 (printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
		# 	set -U fish_greeting $line1\n$line2

    # debug eval profile.print
    # uname -nsr
    # uptime



end
