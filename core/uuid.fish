function uuid

  if linux
    call $python -c 'import uuid; print str(uuid.uuid4()).upper();'
  else if osx
    echo OSX
    echo $uuidgen
    if not test -z "$uuidgen"
      eval $uuidgen
    else
      call $python -c 'import uuid; print str(uuid.uuid4()).upper();'
    end
  else if syno
    call $python -c 'import uuid; print str(uuid.uuid4()).upper();'
  end

end
