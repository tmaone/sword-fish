function ask
echo (color green) $argv[1] [y/n]
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

function ask.empty
	echo -n (green) " > " (normal)
end


function ask.message
	color.red; echo -n $argv ; color.normal ; echo -n " > "
end

function ask.passwd
	color.red; echo -n password ; color.normal ; echo -n " > "
end

function ask.ynask
	echo -n (color.green) "[yY/nN]>" (color.normal)
end
