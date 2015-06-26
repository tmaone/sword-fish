function uuid.init

  if linux
    find.program python
  else if osx
    find.program uuidgen
    find.program python
  else if syno
    find.program python
  end

end
