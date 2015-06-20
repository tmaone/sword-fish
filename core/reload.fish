function reload --description 'Reloads the sword-fish configuration'
  if test -f $sword_root/sword.fish
    set -e sword_core_init
    import.clear
    import core
  end
end
