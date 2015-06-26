function count.words
	if [ (count $argv) = 1 ]
		call $wc -w $argv[1]
	end
end
