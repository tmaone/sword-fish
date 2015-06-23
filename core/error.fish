function error
  # if arg $argv
    # echo (out.ln (color $color_error)error(color $color_normal) $argv) >&2
    # out.ln (color color_error)error(color color_normal) $argv
  # else
    # echo (out.ln (color $color_error)error(color $color_normal) $argv) >&2
    # out.ln (color $color_error)error(color $color_normal) >&2
  # end
end

# if functions -q __fish_command_not_found_handler
#     functions -e __fish_command_not_found_handler
# end
#
# function error.not_found --on-event fish_command_not_found
#     echo "fish: Unknown command '$argv'" >&2
# end
#
# function error.invalid --on-event error_invalid
#     log.error "Invalid argument"
# end
#
# function error.not_enough --on-event error_not_enough
#     log.error "Not enough arguments"
# end
#
# function error.many --on-event error_many
#     log.error "Too many arguments"
# end
