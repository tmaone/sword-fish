function file.base
  echo $argv | awk -F '.' '{print $1}'
end
