function latex.osx
  if dir.exists "/usr/local/texlive/2015/bin/x86_64-darwin"
    path.add "/usr/local/texlive/2015/bin/x86_64-darwin"
  end
end

function latex.linux

end

osx latex.osx
linux latex.linux
