function sword.update.init
  if not set -q update_available
    var.global update_available false
  end
  if not set -q update_chance
    var.global update_chance 50
  end
end
