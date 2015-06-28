function color.original

# Regular syntax highlighting colors
var.default fish_color_normal normal
var.default fish_color_command 005fd7 purple
var.default fish_color_param 00afff cyan
var.default fish_color_redirection normal
var.default fish_color_comment red
var.default fish_color_error red --bold
var.default fish_color_escape cyan
var.default fish_color_operator cyan
var.default fish_color_quote brown
var.default fish_color_autosuggestion 555 yellow
var.default fish_color_valid_path --underline

var.default fish_color_cwd green
var.default fish_color_cwd_root red

# Background color for matching quotes and parenthesis
var.default fish_color_match cyan

# Background color for search matches
var.default fish_color_search_match --background=purple

# Background color for selections
var.default fish_color_selection --background=purple

# Pager colors
var.default fish_pager_color_prefix cyan
var.default fish_pager_color_completion normal
var.default fish_pager_color_description 555 yellow
var.default fish_pager_color_progress cyan

#
# Directory history colors
#

var.default fish_color_history_current cyan

end
