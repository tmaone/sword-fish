#!/usr/bin/env fish

if set -q fish_greeting
    set -e fish_greeting
end

if not set -q sword_root
  if test -d "$HOME/.sword"
    set -xU sword_root "$HOME/.sword"
  end
end

if not set -q sword_core
    set -xU sword_core "$sword_root/core"
end

# Add sword core to fish function path
# Add first in order to be searched first
if not contains $sword_core $fish_function_path
    set fish_function_path $sword_core $fish_function_path
end

import core

function sword

end

if status --is-interactive

end

if status --is-login

end
