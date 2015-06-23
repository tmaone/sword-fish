function ask
echo (green) $argv[1] [y/n]
read ans
switch $ans
case y
	return 0
case Y
	return 0
case '*'
	return 1
end
end

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
