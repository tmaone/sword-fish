function init

  if arg.one $argv

    if functions -q "$argv[1].init"
      eval "$argv[1].init"
    end

  end

end
