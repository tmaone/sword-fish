function fn.add
	set func_name $argv[1]
	echo 'function' $func_name \n 'end'  > $func_name.fish
	edit $func_name.fish
end
