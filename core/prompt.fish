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

  prompt.load

  if not prompt.set
    prompt.set $sword_prompts[1]
  end

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
    if file.exists "$sword_prompt/$prompt/$prompt.prompt"
      source "$sword_prompt/$prompt/$prompt.prompt"
      # debug "$sword_prompt/$prompt/$prompt.prompt"
    end
  end
end

function prompt.list
  out $sword_prompts
end

function prompt.enable
  if arg.one $argv
    if contains "$argv" $sword_prompts
      prompt.set "$argv"
    end
  end
end

function prompt.set
  if arg.one $argv
    if contains $argv[1] $sword_prompts
      var.global prompt "$argv[1].prompt"
      function fish_prompt
        eval $prompt
      end
    end
  else
    if set -q prompt
      return 0
    else
      return 1
    end
  end
end
