function pwd.init

  if not var.exists pwd
    pwd.save
    path.add (pwd.get)
  end

  if not functions -q on_pwd

    function on_pwd -v PWD
      if not test $PWD = (pwd.get)
        if path.contains (pwd.get)
          path.remove (pwd.get)
        end
        pwd.save
        path.add (pwd.get)
      end
    end

  end
end
