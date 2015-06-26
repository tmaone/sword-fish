function var.done
  if arg.one $argv
    if var.query $argv[1]
      if test $argv[1] = done
        return 0
      else
        return 1
      end
    else
      return 1
    end
  else
    return 1
  end
end
