function color.init

	if not set -q color_data
		set -xg color_data "$sword_core/colors"
	end

	function --on-event color_not_found _fish_color_not_found
		error "Color not found!"
	end

	if test -f $color_data
		set -xg color_names (cat "$color_data" | awk -F ' ' '{print $1}')
		set -xg color_rgb (cat "$color_data" | awk -F ' ' '{print $2}' | tr -d '\#')
		set -xg color_count (count $color_names)
			# echo seq $color_count
			for i in (seq $color_count)
				# echo "name:$color_names[$i]" "rgb:$color_rgb[$i]"
				if not set -q color_$color_names[$i]
					set -U color_$color_names[$i] $color_rgb[$i]
				end
				# if not functions -q "color.$color_names[$i]"
				# 	function "color.$color_names[$i]"
				# 	# function "color.$color_names[$i]"
				# 		color "$color_rgb[$i]"
				# 	end
				# end
			end
	end

	var.global color_normal $color_whitesmoke
	var.global color_info 	$color_gray
	var.global color_warn 	$color_palegoldenrod
	var.global color_error 	$color_crimson
	var.global color_debug 	$color_darkorange

end

function color.demo

	for name in $color_names
		out (color $name)"$name "
	end
	#
	# printf "%s\n" (color.black)" Black "(color.gray)" Gray "
	# printf "%s\n" (color.red)" Red "(color.orange)" Orange "
	# printf "%s\n" (color.green)" Green "(color.olive)" Olive "
	# printf "%s\n" (color.yellow)" Yellow "(color.sun)" Sun "
	# printf "%s\n" (color.blue)" Blue "(color.sea)" Sea "
	# printf "%s\n" (color.purple)" Purple "(color.pink)" Pink "
	# printf "%s\n" (color.cyan)" Cyan "(color.pastel)" Pastel "
	# printf "%s\n" (color.normal)" Normal "(color.white)" White "
	#
	# set -l color_names (cat "$color_data" | awk -F ' ' '{print $1}')
	# set -l color_rgb (cat "$color_data" | awk -F ' ' '{print $2}' | tr -d '\#')
	#
	# set -l color_count (count $color_names)

	# for i in (seq $color_count)
	# 	printf "%s\n" (eval "color.$color_names[$i]")"color_$color_names[$i]"
	# 	# echo "name:$color_names[$i]" "rgb:$color_rgb[$i]"
	# end
	# " gray "(color.brown)" brown "(color.blue)" blue "(color.cyan)" cyan "(color.green)" green "(color.magenta)" magenta "(color.normal)" normal "(color.purple)" purple "(color.white)" white "(color.yellow)" yellow "
end

function color

	if arg $argv

		if set -q color_$argv[1]
			set -l color_set color_$argv[1]
			set_color "$$color_set" 2> /dev/null
			return 0
		end

		if set_color $argv[1] 2> /dev/null
			return 0
		end

		emit color_not_found
		return 1

	end

		# if set -q color_$argv[1]
		# 	set -l color_set color_$argv[1]
		# 	if set_color "$$color_set" 2> /dev/null
		# 		# echo $$color_set
		# 		return 0
		# 	else
		# 		emit color_not_found
 	# 			return 1
		# 	end
		# end
		# # if contains $color_names $argv
		# 	echo color_$argv[1]
		# 	# set -l color_set $color_$argv[1]
		# 	# set -U color_$color_names[$i] $color_rgb[$i]
		# 	# echo $color_$argv[1]
		# 	else
			# echo not included

	end

		# if set -q color_$argv[1]
		# 	if set_color "$color_$argv[1]" 2> /dev/null
		# 		return 0
		# 	else
		# 		emit color_not_found
		# 		return 1
		# 	end
		# else
		# # color.demo >/dev/null
		# 	return 0
		# end
	# end
# end

function color.personal

		# color.demo

		#
		# Set various defaults using these throwaway functions
		#

		# function set_default -d "Set a universal variable, unless it has already been set"
		# 	# if not set -q $argv[1]
		# 		set -U -- $argv
		# 	# end
		# end

		# Regular syntax highlighting colors
		# set_default fish_color_normal $color_black
		# set_default fish_color_normal $color_normal

		# set_default fish_color_command $color_purple
		# set_default fish_color_param $color_cyan
		# set_default fish_color_redirection $color_orange
		# set_default fish_color_comment $color_gray
		# set_default fish_color_error $color_red
		# set_default fish_color_escape $color_olive
		# set_default fish_color_operator $color_sun
		# set_default fish_color_quote $color_yellow
		# set_default fish_color_autosuggestion $color_blue
		# set_default fish_color_valid_path $color_blue --underline

		# set_default fish_color_cwd $color_green
		# set_default fish_color_cwd_root $color_red

		# # Background color for matching quotes and parenthesis
		# set_default fish_color_match $color_sea

		# # Background color for search matches
		# set_default fish_color_search_match "--background=$color_purple"

		# # Background color for selections
		# set_default fish_color_selection "--background=$color_purple"

		# # Pager colors
		# set_default fish_pager_color_prefix cyan
		# set_default fish_pager_color_completion normal
		# set_default fish_pager_color_description 555 yellow
		# set_default fish_pager_color_progress cyan

		#
		# Directory history colors
		#

		# set_default fish_color_history_current cyan

end

function color.restore_original_fish_colors
  # Regular syntax highlighting colors
  set fish_color_normal normal
  set fish_color_command 005fd7 purple
  set fish_color_param 00afff cyan
  set fish_color_redirection normal
  set fish_color_comment red
  set fish_color_error red --bold
  set fish_color_escape cyan
  set fish_color_operator cyan
  set fish_color_quote brown
  set fish_color_autosuggestion 555 yellow
  set fish_color_valid_path --underline

  set fish_color_cwd green
  set fish_color_cwd_root red

  # Background color for matching quotes and parenthesis
  set fish_color_match cyan

  # Background color for search matches
  set fish_color_search_match --background=purple

  # Pager colors
  set fish_pager_color_prefix cyan
  set fish_pager_color_completion normal
  set fish_pager_color_description 555 yellow
  set fish_pager_color_progress cyan
end



# …sh_color_autosuggestion  (Variable: 6FC3DF)
# …sh_color_cwd_root       (Variable: B7261B)
# …sh_color_host  (Variable: '-o' 'cyan')
# …sh_color_param                      (Variable: 468DA5)
# …sh_color_selection      (Variable: --background=C817C9)
# …sh_color_command         (Variable: C817C9)
# …sh_color_error          (Variable: B7261B)
# …sh_color_match      (Variable: 62D6F6)
# …sh_color_quote                      (Variable: FFE64D)
# …sh_color_status                         (Variable: red)
# …sh_color_comment         (Variable: 96AAAA)
# …sh_color_escape         (Variable: 7AB44D)
# …sh_color_normal     (Variable: 1D3232)
# …sh_color_redirection                (Variable: DF740C)
# …sh_color_user                  (Variable: '-o' 'green')
# …sh_color_cwd             (Variable: 30B51F)
# …sh_color_history_current  (Variable: cyan)
# …sh_color_operator   (Variable: FFFF00)
# …sh_color_search_match  (Variable: --background=C817C9)
# …sh_color_valid_path  (Variable: '6FC3DF' '--underline')
