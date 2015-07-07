function var.empty

  if arg.one $argv

    if var.exists $argv[1]
      if test (count $$argv[1]) -eq 0
        return 0
      end
      if test -z "$$argv[1]"
        return 0
      end
      return 1
    else
      return 1
    end

  else
    return 0
  end

end
