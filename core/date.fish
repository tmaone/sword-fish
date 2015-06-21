function date
  if arg $argv
    call $date $argv
  end
end

function date.init
  find.program date
end

function date.today
    call $date +"%A, %B %-d, %Y"
end

function date.day
  call $date "+%A"
end

function date.dayn
  call $date "+%d"
end

function date.month
  call $date "+%B"
end

function date.week
  call $date "+%V"
end

function date.year
  call $date +%Y
end

function date.time
  call $date "+%H:%M:%S"
end

function date.hour
  call $date +"%H"
end

function date.minute
  call $date +"%M"
end

function date.seconds
  call $date +"%S"
end

function date.timestamp
  call $date "+%Y%m%d%H%M%S"
end
