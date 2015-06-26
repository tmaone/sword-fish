function host.domain
  echo "$argv" | cut -d'/' -f3
end
