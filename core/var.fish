function var
  # builtin set $argv
end


function var.set
  if arg.two $argv
    var.global $argv[1] $argv[2..-1]
    echo $argv[1] "--" "$argv[2..-1]"
  end
end

function var.get
  if arg.one $argv
    out $$argv[1]
  end
end

function var.query
  if arg.one $argv
    if set -q $argv[1]
      return 0
    else
      return 1
    end
  end
end

function var.remove
  if arg.one $argv
    if var.query $argv[1]
      set -e $argv[1]
    end
  end
end

function var.default
  set -U -- $argv
end

function var.global
  set -xg -- $argv
end


function var.local
  set -l -- $argv
end

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
