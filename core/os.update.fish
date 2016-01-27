function os.update
  
  sudo.validate;
  
  osx.update;
  
  sudo.validate

  brew.update; brew.upgrade;

  sudo.validate
  
  cd ~/src/language/julia; git pull; make install; cd ~
  
  sudo.validate

  julia -e "Pkg.update();Pkg.build()"

  sudo.validate

  apm update --confirm false

  sudo.validate
  
  sudo tlmgr update --self --all --reinstall-forcibly-removed

end
