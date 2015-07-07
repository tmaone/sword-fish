# !/usr/bin/env fish

if not set -q sword_root
  if test -d "$HOME/.sword"
    set -xg sword_root "$HOME/.sword"
  end
end

if not set -q sword_core
    set -xg sword_core "$sword_root/core"
end

# Add sword core to fish function path
# Add first in order to be searched first
if not contains $sword_core $fish_function_path
    set fish_function_path $sword_core $fish_function_path
end

core.init

if status --is-interactive

end

if status --is-login

end;
