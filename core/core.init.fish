function core.init

    var.global init_functions (fn.list | grep ".init")
    var.remove init_functions "core.init"

    for init_function in $init_functions
      call "$init_function"
      debug "core.init: $init_function"
    end

    # profile

    # emit profile


end
