function file.init
  find.program file
end

function file
  if arg $argv
    call $file $argv
  end
end

function file.exists
  if test -f $argv
    return 0
  else
    return 1
  end
end

function file.create
  if not file.exists $argv
    touch $argv
    return 0
  else
    return 1
  end
end

function file.empty --description 'Show empty files '
    if  test arg.count = 1
        find "$argv" -type f -empty
    else
        find . -type f -empty
    end
end

function file.sanitize
  sudo chmod -R u=rwX,go=rX $argv
  sudo chown -R $USER:staff $argv
end

function file.name
  if arg $argv
    out.ln (basename $argv)
  else

  end
end

function file.base
  echo $argv | awk -F '.' '{print $1}'
end

function file.extension

  if test (count $argv) = 0

  end

  if test (count $argv) = 1
    if test -f $argv
      ls $argv | awk -F '.' '{print $NF}'
    end
  end

  if arg.two $argv
    for argument in $argv
      # echo $argument
      # ls $argument | awk -F '.' '{print $NF}'
      set files (find (wd) -maxdepth 1 -type f -name "*.$argument" -print)
      for file in $files
        # echo $file
        file.name $file
      end
    end
  end

end


function file.info
echo (red) implement it!
# set width 72
# for input
# set lines (wc -l < $input | sed 's/ //g')
# set chars (wc -c < $input | sed 's/ //g')
# set owner (ls -ld $input | awk '{print $3}')
# echo "-----------------------------------------------------------------"
# echo "File $input ($lines lines, $chars characters, owned by $owner):"
# echo "-----------------------------------------------------------------"
#   while read line
#     do
#       if [ ${#line} -gt $width ] ; then
#         echo "$line" | fmt | sed -e '1s/^/  /' -e '2,$s/^/+ /'
#       else
#         echo "  $line"
#       fi
#     done < $input
#   echo "-----------------------------------------------------------------"
# done | more

end
