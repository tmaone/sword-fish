if not var.done find_init
  find.init
end

function find.path
    # echo $argv

    if syno
      if arg.one $argv
        call $which "$argv[1]"
      end
    else
      if arg.one $argv
        call $which -a "$argv[1]"
      end
    end
    
end
