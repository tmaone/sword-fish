function sword.update.init

  if not set -q sword_update_available
    var.global sword_update_available false
  end

  if not set -q sword_update_chance
    var.global sword_update_chance 50
  end

end
