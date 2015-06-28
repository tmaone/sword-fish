function color.personalize

		# Regular syntax highlighting colors

		var.default fish_color_normal $color_normal

		var.default fish_color_command $color_deepskyblue
		var.default fish_color_param $color_coral
		var.default fish_color_redirection $color_royalblue
		var.default fish_color_comment $color_gray
		var.default fish_color_error $color_tomato
		var.default fish_color_escape $color_gold
		var.default fish_color_operator $color_mediumslateblue
		var.default fish_color_quote $color_chartreuse
		var.default fish_color_autosuggestion $color_gray
		var.default fish_color_valid_path $color_mediumaquamarine --underline

		var.default fish_color_cwd $color_mediumspringgreen
		var.default fish_color_cwd_root $color_deeppink

		# Background color for matching quotes and parenthesis
		var.default fish_color_match $color_lightgrey

		# Background color for search matches
		var.default fish_color_search_match "--background=$color_deepskyblue"

		# Background color for selections
		var.default fish_color_selection "--background=$color_purple"

		# # Pager colors
		# var.default fish_pager_color_prefix normal
		# var.default fish_pager_color_completion normal
		# var.default fish_pager_color_description 555 normal
		# var.default fish_pager_color_progress normal
		#
		# # Directory history colors
		#
		# var.default fish_color_history_current normal

		# # Regular syntax highlighting colors
		# var.default fish_color_normal normal
		# var.default fish_color_command 005fd7 purple
		# var.default fish_color_param 00afff cyan
		# var.default fish_color_redirection normal
		# var.default fish_color_comment red
		# var.default fish_color_error red --bold
		# var.default fish_color_escape cyan
		# var.default fish_color_operator cyan
		# var.default fish_color_quote brown
		# var.default fish_color_autosuggestion 555 yellow
		# var.default fish_color_valid_path --underline
		#
		# var.default fish_color_cwd green
		# var.default fish_color_cwd_root red
		#
		# # Background color for matching quotes and parenthesis
		# var.default fish_color_match cyan
		#
		# # Background color for search matches
		# var.default fish_color_search_match --background=purple
		#
		# # Background color for selections
		# var.default fish_color_selection --background=purple
		#
		# # Pager colors
		# var.default fish_pager_color_prefix cyan
		# var.default fish_pager_color_completion normal
		# var.default fish_pager_color_description 555 yellow
		# var.default fish_pager_color_progress cyan
		#
		# #
		# # Directory history colors
		# #
		#
		# var.default fish_color_history_current cyan

		#
		# fish_color_autosuggestion
		# fish_color_command
		# fish_color_cwd_root
		# fish_color_cwd
		# fish_color_error
		# fish_color_escape
		# fish_color_history_current
		# fish_color_match
		# fish_color_normal
		# fish_color_param
		# fish_color_operator
		# fish_color_quote
		# fish_color_redirection
		# fish_color_search_match
		# fish_color_valid_path
		#
		# (Variable: '555' 'yellow')  $sh_color_error  (Variable: 'red' '--bold')  $sh_color_git_deleted      (Variable: red)  $sh_color_git_unmerged      (Variable: red)  $sh_color_operator                     (Variable: cyan)  $sh_color_selection  (Variable: --background=800080)
		# $sh_color_command      (Variable: '005fd7' 'purple')  $sh_color_escape           (Variable: cyan)  $sh_color_git_dirty        (Variable: red)  $sh_color_git_untracked  (Variable: yellow)  $sh_color_param             (Variable: '00afff' 'cyan')  $sh_color_valid_path         (Variable: --underline)
		# $sh_color_comment                    (Variable: red)  $sh_color_git_added       (Variable: green)  $sh_color_git_modified    (Variable: blue)  $sh_color_history_current  (Variable: cyan)  $sh_color_quote                       (Variable: brown)
		# $sh_color_cwd                      (Variable: green)  $sh_color_git_clean       (Variable: green)  $sh_color_git_renamed  (Variable: magenta)  $sh_color_match            (Variable: cyan)  $sh_color_redirection                (Variable: normal)
		# $sh_color_cwd_root                   (Variable: red)  $sh_color_git_copied    (Variable: magenta)  $sh_color_git_staged    (Variable: yellow)  $sh_color_normal         (Variable: normal)  $sh_color_search_match  (Variable: --background=purple)
		#


		#
		# fish_color_autosuggestion  (Variable: 6FC3DF)
		# fish_color_cwd_root       (Variable: B7261B)
		# fish_color_host  (Variable: '-o' 'cyan')
		# fish_color_param                      (Variable: 468DA5)
		# fish_color_selection      (Variable: --background=C817C9)
		# fish_color_command         (Variable: C817C9)
		# fish_color_error          (Variable: B7261B)
		# fish_color_match      (Variable: 62D6F6)
		# fish_color_quote                      (Variable: FFE64D)
		# fish_color_status                         (Variable: red)
		# fish_color_comment         (Variable: 96AAAA)
		# fish_color_escape         (Variable: 7AB44D)
		# fish_color_normal     (Variable: 1D3232)
		# fish_color_redirection                (Variable: DF740C)
		# fish_color_user                  (Variable: '-o' 'green')
		# fish_color_cwd             (Variable: 30B51F)
		# fish_color_history_current  (Variable: cyan)
		# fish_color_operator   (Variable: FFFF00)
		# fish_color_search_match  (Variable: --background=C817C9)
		# fish_color_valid_path  (Variable: '6FC3DF' '--underline')
		#
		# # Regular syntax highlighting colors
		# set_default fish_color_normal normal
		# set_default fish_color_command 005fd7 purple
		# set_default fish_color_param 00afff cyan
		# set_default fish_color_redirection normal
		# set_default fish_color_comment red
		# set_default fish_color_error red --bold
		# set_default fish_color_escape cyan
		# set_default fish_color_operator cyan
		# set_default fish_color_quote brown
		# set_default fish_color_autosuggestion 555 yellow
		# set_default fish_color_valid_path --underline
		#
		# set_default fish_color_cwd green
		# set_default fish_color_cwd_root red
		#
		# # Background color for matching quotes and parenthesis
		# set_default fish_color_match cyan
		#
		# # Background color for search matches
		# set_default fish_color_search_match --background=purple
		#
		# # Background color for selections
		# set_default fish_color_selection --background=purple
		#
		# # Pager colors
		# set_default fish_pager_color_prefix cyan
		# set_default fish_pager_color_completion normal
		# set_default fish_pager_color_description 555 yellow
		# set_default fish_pager_color_progress cyan
		#
		# #
		# # Directory history colors
		# #
		#
		# set_default fish_color_history_current cyan


end
