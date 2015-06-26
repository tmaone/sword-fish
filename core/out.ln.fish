# function out.ln
#   if arg $argv
#     echo $argv
#   end
# end

function out.ln

  if arg $argv
    # count $argv
    # echo $argv
    if arg.one $argv
      printf "      %s" $argv[1]
    else if arg.two $argv
      printf "%s %s" $argv[1] $argv[2]
    else if test (arg.count $argv) -gt 2
      printf "%s %s %s"  $argv[1] $argv[2] $argv[3..-1]
    end
    printf "\n"
  else
    printf "      \n"
  end
  #   if arg.one
  #     echo $argv
  #       # printf "      %s" $argv[1]
  #   else if arg.two
  #       # printf "%s %s" $argv[1] $argv[2]
  #   else if test (arg.count $argv) -gt 2
  #       printf "%s %s %s"  $argv[1] $argv[2] $argv[3..-1]
  #   end
  # else
  #   printf "      "
  # end
  # # for argu in $argv
  # #   printf "      %s" $argu
  # # # if arg $argv
  # # #   printf "" $argv
  # # end
  #
end
