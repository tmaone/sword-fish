function error
  if error.enabled
    if arg $argv
      out.ln (color $color_error)"error"(color $color_normal) "$argv"
    # echo (out.ln (color $color_error)error(color $color_normal) $argv) >&2
    # out.ln (color color_error)error(color color_normal) $argv
  # else
    # echo (out.ln (color $color_error)error(color $color_normal) $argv) >&2
    # out.ln (color $color_error)error(color $color_normal) >&2
    end
  # echo (red) "⁐" (normal) "$argv"(red) .(normal)
  end
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


# #
# # Create the default command_not_found handler
# #
# function __fish_default_command_not_found_handler
#     echo "fish: Unknown command '$argv'" >&2
# end
#
# #
# # Hook up the default as the principal command_not_found handler
# # This is likely to be overwritten in __fish_config_interactive
# #
# function __fish_command_not_found_handler --on-event fish_command_not_found
#     __fish_default_command_not_found_handler $argv
# end
