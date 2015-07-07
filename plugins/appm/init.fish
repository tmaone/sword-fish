function appm.osx

  if not set -q appm_root
    var.global appm_root "$sword_plugin_root/appm"
  end

  if file.exists "$appm_root/exclude"
    var.global appm_exlude (cat "$appm_root/exclude")
  else
    var.global appm_exlude ""
  end

end

function appm.linux
  error "Not supported"
end

osx appm.osx
linux appm.linux
