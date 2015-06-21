function addressbook
  if not test -z "$ab"
    eval $ab $argv
  else
    out.ln "not available"
  end
end
