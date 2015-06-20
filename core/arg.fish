function arg
  if test (count $argv) -gt 0
    return 0
  else
    return 1
  end
end

function arg.one
    if test (count $argv) -ge 1
        return 0
    else
        return 1
    end
end

function arg.two
    if test (count $argv) -ge 2
        return 0
    else
        return 1
    end
end

function arg.three
    if test (count $argv) -ge 3
        return 0
    else
        return 1
    end
end

function arg.many
    if test (count $argv) -gt 3
        return 0
    else
        return 1
    end
end

function arg.first
    if arg.one $argv
        echo $argv[1]
        return 0
    else
        return 1
    end
end

function arg.second
    echo (count $argv)
    if arg.two $argv
        echo $argv[2]
        return 0
    else
        return 1
    end
end


function arg.third
    if arg.three $argv
        echo $argv[3]
        return 0
    else
        return 1
    end
end

function arg.count
    count $argv
end
