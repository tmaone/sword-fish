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
				# echo "name:$color_names[$i]\nrgb:$color_rgb[$i]"
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
