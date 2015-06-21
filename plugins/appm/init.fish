function appm.osx

  if not set -q appm_root
    var.global appm_root "$sword_plugin/appm"
  end

  if not set -q appm_exclude
    if file.exists "$appm_root/exclude"
      var.global appm_exlude "$appm_root/exclude"
    end
  end

end

function appm.linux
  error "Not supported"
end

osx appm.osx
linux appm.linux
