import arg error

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
				# if functions -q "color.$color_names[$i]"
				# 	functions -e "color.$color_names[$i]"
				# 	# function "color.$color_names[$i]"
				# 	# 	color "$color_rgb[$i]"
				# 	# end
				# end
			end

		end

end

function color.black
	color "$color_black"
end

function color.gray
	color "$color_gray"
end

function color.red
	color "$color_red"
end

function color.orange
	color "$color_orange"
end

function color.green
	color "$color_green"
end

function color.olive
	color "$color_olive"
end

function color.yellow
	color "$color_yellow"
end

function color.sun
	color "$color_sun"
end

function color.blue
	color "$color_blue"
end

function color.sea
	color "$color_sea"
end


function color.purple
	color "$color_purple"
end

function color.pink
	color "$color_pink"
end


function color.cyan
	color "$color_cyan"
end

function color.pastel
	color "$color_pastel"
end

function color.normal
	color "$color_normal"
end

function color.white
	color "$color_white"
end

function color.brown
	set_color brown
end

function color.demo
	printf "%s\n" (color.black)" Black "(color.gray)" Gray "
	printf "%s\n" (color.red)" Red "(color.orange)" Orange "
	printf "%s\n" (color.green)" Green "(color.olive)" Olive "
	printf "%s\n" (color.yellow)" Yellow "(color.sun)" Sun "
	printf "%s\n" (color.blue)" Blue "(color.sea)" Sea "
	printf "%s\n" (color.purple)" Purple "(color.pink)" Pink "
	printf "%s\n" (color.cyan)" Cyan "(color.pastel)" Pastel "
	printf "%s\n" (color.normal)" Normal "(color.white)" White "

	set -l color_names (cat "$color_data" | awk -F ' ' '{print $1}')
	set -l color_rgb (cat "$color_data" | awk -F ' ' '{print $2}' | tr -d '\#')

	set -l color_count (count $color_names)

	# for i in (seq $color_count)
	# 	printf "%s\n" (eval "color.$color_names[$i]")"color_$color_names[$i]"
	# 	# echo "name:$color_names[$i]" "rgb:$color_rgb[$i]"
	# end
	# " gray "(color.brown)" brown "(color.blue)" blue "(color.cyan)" cyan "(color.green)" green "(color.magenta)" magenta "(color.normal)" normal "(color.purple)" purple "(color.white)" white "(color.yellow)" yellow "
end

function color.clear
	set -e color_black
	set -e color_gray
	set -e color_red
	set -e color_orange
	set -e color_green
	set -e color_olive
	set -e color_yellow
	set -e color_sun
	set -e color_blue
	set -e color_sea
	set -e color_purple
	set -e color_pink
	set -e color_cyan
	set -e color_pastel
	set -e color_normal
	set -e color_white
end

function color
	if arg.has_args $argv
		# echo $argv
		if set_color $argv 2> /dev/null
			return 0
		else
			# set_color $argv 2> /dev/null
			emit color_not_found
			return 1
		end
	else
		color.demo >/dev/null
		return 0
	end
end

function color.personal

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
