function color.demo

	for fgbg in 38 48
		for color in (seq 0 256)
		  echo -en "\e["$fgbg";5;"$color"m "$color"\t\e[0m"
		  if test (count $color+1 % 10) -eq 0
			  	echo -e "\n"
		  end
	  end
		echo -e "\n"
   end

	for attr in (seq 0 1)
  	for fg in (seq 30 37)
    	for bg in (seq 40 47)
      	printf "\033["$attr";"$bg";"$fg"m"$attr";"$fg";"$bg"\033[m "
    	end
      echo
		end
  end

	echo -e "\n"

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
	# 	# echo "name:$color_names[$i]\nrgb:$color_rgb[$i]"
	# end
	# " gray "(color.brown)" brown "(color.blue)" blue "(color.cyan)" cyan "(color.green)" green "(color.magenta)" magenta "(color.normal)" normal "(color.purple)" purple "(color.white)" white "(color.yellow)" yellow "
end
