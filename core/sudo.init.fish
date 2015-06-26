function sudo.init
  find.program sudo
  find.program su
  # if not set -q sudo
  #   set -xg sudo 'su - '
  # end
end
