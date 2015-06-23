function in
	set -l numarg (count $argv)
	switch $numarg
	case 0 # prompt.emptyask
		set -l asktemp (read -p prompt.emptyask askresult)
		echo "$askresult" #hack
		return 0
	case 1 # prompt.custom
		set -l asktemp (read -p $argv[1] askresult)
		echo "$askresult"
		return 0
	case '*'
		err.toomany
		return 1
		# (read -l -p prompt.emptyask asktemp | call echo $asktemp)
		# echo (color.green) $argv[1] (color.normal)
		# (read -p prompt.emptyask asktemp | echo $asktemp)
	# case 2
		# echo (color.green) $argv[1] (color.normal)
	# case 3
	# case 1
	end
	# read -p prompt.emptyask ans | echo ^0
	# echo "$ans"
	# set STATUS "$ans"
	# set -g askresult "$ans"
end
