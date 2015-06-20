function uuid.init
  find.program python
  osx find.program uuidgen
end

function uuid

    if osx
      if not test -z $uuidgen
        eval $uuidgen
      else
        call $python -c 'import uuid; print str(uuid.uuid4()).upper();'
      end
    end

    if linux
      call $python -c 'import uuid; print str(uuid.uuid4()).upper();'
    end

end
