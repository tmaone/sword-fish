function var.clean --description 'Remove duplicates from environment variable'
    if test (count $argv) = 1
        set -l newvar
        set -l count 0
        for v in $$argv
            if contains -- $v $newvar
                set count (math $count + 1)
            else
                set newvar $newvar $v
            end
        end
        set $argv $newvar
        if test $count -gt 0
            debug "Removed $count duplicates from $argv"
        end
    else
        for a in $argv
            var.clear $a
        end
    end
end
