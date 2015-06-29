function syno.log
  if sudo.validate
    call $sudo $tail -f /var/log/messages
  else
    error "needs administrator permissions"
  end
end
