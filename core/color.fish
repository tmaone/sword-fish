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
