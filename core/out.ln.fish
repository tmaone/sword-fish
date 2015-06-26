# function out.ln
#   if arg $argv
#     echo $argv
#   end
# end

function out.ln
  for argu in $argv
    printf "%s" $argu
  # if arg $argv
  #   printf "" $argv
  end
  printf "\n"
end
