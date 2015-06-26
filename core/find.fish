function find.init

  if not set -q find_init
    set -xg which (which which)
    set -xg found "which"
    find.program find
    set -xg find_init "done"
  end

end

# init find_init

function find

    if not set -q find_init
      find.init
    end

    if arg $argv
      call $find $argv
    end

end
