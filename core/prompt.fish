function prompt.init

  if not set -q sword_prompt
    set -xg sword_prompt "$sword_root/prompts"
  end

  if not dir.exists $sword_prompt
    dir.create $sword_prompt
  end

  if dir.exists $sword_prompt
    set -xg sword_prompts (ls $sword_prompt/*.prompt)
  end

  prompt.load

  set -xg prompt_init

end

function prompt
  if not set -q plugin_init
    prompt.init
  end

  if arg $argv
    if contains "$argv" $sword_prompts
      return 0
    else
      return 1
    end
  else
    out $sword_prompts
    return 0
  end

end

function prompt.load
  for prompt in $sword_prompts

  # if arg $argv
    # if file.exists "$sword_prompt/$plugin/.enabled"
  #   for prompt in $argv
  #     if file.exists "$sword_prompt/$plugin/.enabled"
  #       if file.exists "$sword_plugin/$plugin/init.fish"
  #         source "$sword_plugin/$plugin/init.fish"
  #       end
  #       if dir.exists "$sword_plugin/$plugin/src"
  #         fn.path.add "$sword_plugin/$plugin/src"
  #       end
  #     end
  #   end
  # else
  #   for plugin in $sword_plugins
  #     if file.exists "$sword_plugin/$plugin/.enabled"
  #       if file.exists "$sword_plugin/$plugin/init.fish"
  #         source "$sword_plugin/$plugin/init.fish"
  #       end
  #       if dir.exists "$sword_plugin/$plugin/src"
  #         fn.path.add "$sword_plugin/$plugin/src"
  #       end
  #     end
  #   end
  end

end
