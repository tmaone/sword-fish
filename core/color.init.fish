function color.init

	if not set -q color_data
		var.global color_data "$sword_core/colors"
	end

	function _fish_color_not_found --on-event color_not_found
		error "color not found"
	end

	if test -f $color_data
	  var.global color_names (cat "$color_data" | awk -F ' ' '{print $1}')
		var.global color_rgb (cat "$color_data" | awk -F ' ' '{print $2}' | tr -d '\#')
		var.global color_count (count $color_names)
			# echo seq $color_count
			for i in (seq $color_count)
				# echo "name:$color_names[$i]\nrgb:$color_rgb[$i]"
				if not set -q color_$color_names[$i]
					var.global color_$color_names[$i] $color_rgb[$i]
				end
				# if not functions -q "color.$color_names[$i]"
				# 	function "color.$color_names[$i]"
				# 	# function "color.$color_names[$i]"
				# 		color "$color_rgb[$i]"
				# 	end
				# end
			end
	end

	if not set -q color_set
		var.global color_set default
	end

	var.global color_normal $color_whitesmoke
	var.global color_info 	$color_gray
	var.global color_warn 	$color_palegoldenrod
	var.global color_error 	$color_crimson
	var.global color_debug 	$color_darkorange

end
