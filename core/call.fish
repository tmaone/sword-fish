function call --description 'Run a builtin or program' --no-scope-shadowing
  set -l redir
  if arg $argv

    switch "$argv[1]";
      case -r --redirection
        set redir $argv[2]
        set -e argv[1 2]
    end

    set -l cmd $argv[1]
    set -e argv[1]

    #
    # Set job control for interactive mod
    #
    set -l __call_recover_mode
    if status --is-interactive-job-control
      set __call_recover_mode interactive
    else
      if status --is-full-job-control
        set __call_recover_mode full
      else
        set __call_recover_mode none
      end
    end

    if status --is-interactive
      status --job-control full
    end

    #
    # Define main function and call
    #
    echo "function -S __run_internal_function_name; $cmd \$argv $redir; end"  | .
    set -e cmd
    set -e redir
    __run_internal_function_name $argv

    #
    # Clear and return
    #
    set -l stat $status
    functions -e __run_internal_function_name
    status --job-control $__call_recover_mode
    return $stat
  end
end
