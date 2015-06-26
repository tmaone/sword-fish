function reload --description 'Reloads the sword-fish configuration'
  if file.exists "$sword_root/sword.fish"
    var.erase sword_core_init
    var.erase sword_imports
    source $sword_root/sword.fish
  end
end
