function color.personalize

		# color.demo

		#
		# Set various defaults using these throwaway functions
		#

		function set_default -d "Set a universal variable, unless it has already been set"
			# if not set -q $argv[1]
				set -U -- $argv
			# end
		end

		# Regular syntax highlighting colors
		# set_default $color_black
		set_default fish_color_normal $color_normal

		set_default fish_color_command $color_purple
		set_default fish_color_param $color_cyan
		set_default fish_color_redirection $color_orange
		set_default fish_color_comment $color_gray
		set_default fish_color_error $color_red
		set_default fish_color_escape $color_olive
		set_default fish_color_operator $color_sun
		set_default fish_color_quote $color_yellow
		set_default fish_color_autosuggestion $color_blue
		set_default fish_color_valid_path $color_blue --underline

		set_default fish_color_cwd $color_green
		set_default fish_color_cwd_root $color_red

		# Background color for matching quotes and parenthesis
		set_default fish_color_match $color_sea

		# Background color for search matches
		set_default fish_color_search_match "--background=$color_purple"

		# Background color for selections
		set_default fish_color_selection "--background=$color_purple"

		# Pager colors
		set_default fish_pager_color_prefix cyan
		set_default fish_pager_color_completion normal
		set_default fish_pager_color_description 555 yellow
		set_default fish_pager_color_progress cyan

		# Directory history colors

		set_default fish_color_history_current cyan

end
