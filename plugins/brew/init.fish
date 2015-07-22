function brew.init.osx

find.program brew

set brew_path "/usr/local/bin" "/usr/local/sbin"

for path in $brew_path
  if dir.exists $path
    if not path.contains $path
      path.add $path
    end
  end
end

end

osx brew.init.osx
linux emit not_supported
