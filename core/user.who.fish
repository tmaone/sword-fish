function user.who
  out (who | cut -d ' ' -f1 | sort | uniq | count.lines)
end
