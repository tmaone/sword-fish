function progress --description 'Evaluates and propagates the return status of the previous job'
    if test $status = 0
        printf "%s%s%s" (color green) "☐" (color normal)
        return 0
    else
        printf "%s%s%s %s" (color red) "!" (color normal) (status -t)
        return 1
    end
end

# ❩º✇♁♁♀♂♁✧✙✚◎◉⦿☐■▪︎◼︎◻︎▶︎✦✧✩✔︎✖︎⨀⊙⦿

function progress.bar

end
