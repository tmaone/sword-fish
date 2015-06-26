function time
    call $date "+%H:%M:%S"
end

function time.hour
  call $date +"%H"
end

function time.minute
  call $date +"%M"
end

function time.seconds
  call $date +"%S"
end

function time.stamp
  call $date "+%Y%m%d%H%M%S"
end

function time.countdown

    set -l MIN 1

    if test (count $argv) = 1
        # set MAX (math "$argv[1] * 60")
        for i in (seq $MIN $argv[1])
            out (color blue)"$i ";
            sleep 1
        end
    out (color red)"... end"(color normal)"."
    else
        set MAX (math "$MIN * 3")
        for i in (seq $MIN $MAX)
            out (color blue)"$i ";
            sleep 1
        end
        out (color red)"... end"(color normal)"."
    end

end

function time.stopwatch
set BEGIN (date "+%s")
while true
    set NOW (date "+%s")
    set DIFF (math "$NOW - $BEGIN")
    set MINS (math "$DIFF / 60")
    set SECS (math "$DIFF % 60")
    # out.ln $BEGIN $NOW $DIFF $MINS $SECS
    echo -ne "Time elapsed ["$MINS":"(printf "%02d" $SECS)"]\r"
    # echo -ne Time elapsed: $MINS:`printf %02d $SECS` \r
    sleep .1
end
end
