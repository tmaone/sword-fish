function brew.list
  brew list 2> /dev/null | awk '{ORS=" " ; print;}'
end
