function prompt.init

  if not set -q sword_prompt
    set -xg sword_prompt "$sword_root/prompts"
  end

  if not dir.exists $sword_prompt
    dir.create $sword_prompt
  end

  if dir.exists $sword_prompt
    set -xg sword_prompts (ls $sword_prompt)
  end

  for prompt in $sword_prompts
    prompt.load $prompt
  end

  if not prompt.set
    prompt.set "sword-fish/sword-fish"
  end

  set -xg prompt_init done

end
