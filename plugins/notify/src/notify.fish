function notify
  if not test -z $notify
      call $notify $argv
  end
end
