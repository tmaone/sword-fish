function color.init

	if not set -q color_data
		set -xg color_data "$sword_core/colors"
	end

	function --on-event color_not_found _fish_color_not_found
		error "Color not found!"
	end

	if not set -q color_black
		set -U color_black "1D3232"
	end

	if not set -q color_gray
		set -U color_gray "96AAAA"
	end

	if not set -q color_red
		set -U color_red "B7261B"
	end

	if not set -q color_orange
		set -U color_orange "DF740C"
	end

	if not set -q color_green
		set -U color_green "30B51F"
	end

	if not set -q color_olive
		set -U color_olive "7AB44D"
	end

	if not set -q color_yellow
		set -U color_yellow "FFE64D"
	end

	if not set -q color_sun
		set -U color_sun "FFFF00"
	end

	if not set -q color_blue
		set -U color_blue "6FC3DF"
	end

	if not set -q color_sea
		set -U color_sea "62D6F6"
	end

	if not set -q color_purple
		set -U color_purple "C817C9"
	end

	if not set -q color_pink
		set -U color_pink "C890C9"
	end

	if not set -q color_cyan
		set -U color_cyan "468DA5"
	end

	if not set -q color_pastel
		set -U color_pastel "50ABC5"
	end

	if not set -q color_normal
		set -U color_normal "C8F0DD"
	end

	if not set -q color_white
		set -U color_white "E6FFFF"
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

	var.xglobal color_info $color_gray

end

function color.demo

	for name in $color_names
		echo -n (color $name) $name
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
			var.local color_set color_$argv[1]
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
		set_default fish_color_normal $color_black
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

		set_default fish_color_history_current cyan

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
