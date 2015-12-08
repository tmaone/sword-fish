function os.update
  sudo.validate
  osx.update;
  brew.update; brew.upgrade;
  cd ~/src/language/julia; git pull; make install; cd ~
  julia -e "Pkg.update();Pkg.build()"
  apm update --confirm false
  tlmgr update --self --all --reinstall-forcibly-removed
end
