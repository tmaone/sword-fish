function ask.yn
	set -l numarg (count $argv)
	switch $numarg
	case 0 # prompt.emptyask
		set -l asktemp (read -p prompt.ynask askresult)
		switch $askresult
			case y
				echo "$askresult"
				return 0
			case Y
				echo "$askresult"
				return 0
			case '*'
				return 1
			end
	case '*'
		err.novalid
	end
end
