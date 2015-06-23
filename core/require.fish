function require
	if [ (count $argv) -gt 0 ]
		debug require has arguments
	switch $OS
	case darwin
		osx-require $argv
	case windows
		error not implemented yet
	case linux
		error not implemented yet
	end
	else
		error no arguments
	end
end
