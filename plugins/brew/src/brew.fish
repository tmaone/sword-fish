function brew
    /usr/local/bin/brew $argv
end

function brew.update
  brew  update
  brew.outdated
  brew upgrade --all
end

function brew.outdated
  brew outdated
end

function brew.doctor
  brew  doctor
end

function brew.list
  brew list 2> /dev/null | awk '{ORS=" " ; print;}'
end

function brew.clean
  brew cleanup;
end

function brew.pin
  brew pin $argv;
end

function brew.unpin
  brew pin $argv;
end
