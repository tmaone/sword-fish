function progress --description 'Evaluates and propagates the return status of the previous job'
    if test $status = 0
        out (color green)'☐'(color normal)
        return 0
    else
        out (color red)'!'(color normal)
        return 1
    end
end

# ❩º✇♁♁♀♂♁✧✙✚◎◉⦿☐■▪︎◼︎◻︎▶︎✦✧✩✔︎✖︎⨀⊙⦿

function progress.bar

end

function progress.copy
	require pv

	pv $argv[1] $argv[2]
		# ``
  # if [ `echo "$2" | grep ".*\/$"` ]
  # then
  #   pv "$1" > "$2""$1"
  # else
  #   pv "$1" > "$2"/"$1"
  # fi
end
