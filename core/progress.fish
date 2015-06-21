function progress --description 'Evaluates and propagates the return status of the previous job'
    if test $status = 0
        out (color green) "☐" (color normal)
        return 0
    else
        out (color red) "!" (color normal)
        return 1
    end
end

# ❩º✇♁♁♀♂♁✧✙✚◎◉⦿☐■▪︎◼︎◻︎▶︎✦✧✩✔︎✖︎⨀⊙⦿

function progress.bar

end
