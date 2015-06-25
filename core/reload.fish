function reload --description 'Reloads the sword-fish configuration'
  if file.exists "$sword_root/sword.fish"
    var.remove sword_core_init
    var.remove sword_imports
    source $sword_root/sword.fish
  end
end
