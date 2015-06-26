function file.sanitize
  sudo chmod -R u=rwX,go=rX $argv
  sudo chown -R $USER:staff $argv
end
