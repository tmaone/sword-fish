function wd.get
  if set -q sword_wd
    echo "$sword_wd"
  else
    echo ""
  end
end
