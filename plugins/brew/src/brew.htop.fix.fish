function brew.htop.fix
  sudo.validate
  set -l htop_bin (which htop)
  sudo chown root:wheel $htop_bin
  sudo chmod u+s $htop_bin
end
