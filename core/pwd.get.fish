function pwd.get
  if set -q pwd
    echo "$pwd"
  else
    pwd
  end
end
