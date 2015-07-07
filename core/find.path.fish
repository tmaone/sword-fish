if not var.done find_init
  find.init
end

function find.path

  if arg $argv
    call $which -a "$argv[1]"
  end

end

#
# if test linux -o darwin
# end
#
# if test syno
#   call $which "$argv[1]"
# end


  # set -l synology (syno)
  #
  # if syno
  #   if arg.one $argv
  #     call $which "$argv[1]"
  #   end
  # else
  #   if arg.one $argv
  #     call $which -a "$argv[1]"
  #   end
  # end
  #
