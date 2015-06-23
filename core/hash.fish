function hash
  if arg $argv
    call $hash $argv
  end
end

function hash.init
  find.program hash
  find.program sed
  find.program md5
end

function hash.md5
	if arg.one $argv
    if file.exists "$argv"
      set -l md5 (call $sed 's/md5=//g' (call $md5 -q "$argv[1]" | psub))
      echo $md5
      return 0
  	else
    	return 1
    end
  end
end
