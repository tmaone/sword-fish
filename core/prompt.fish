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

function prompt

  if not set -q plugin_init
    prompt.init
  end

  if arg $argv
    if prompt.set "$argv"
      return 0
    else
      return 1
    end
  else
    out.ln (prompt.list)
    return 0
  end

end

function prompt.load
  if arg.one $argv
    wd.save
    # cd $sword_prompt/$argv
    # # wd
    # # file.extension prompt
    # set -l prompt_files (file.extension 'prompt')
    # # set -l sword_prompts (file.extension prompt)
    #
    # # echo $sword_prompts
    # for file in $prompt_files
    # #   echo $file
    # #   if file.exists "$file"
    # echo "builtin source" "$argv"
    # #     builtin source "$file"
    # #   end
    # end
    wd.cd
  end
end

function prompt.list
  for prompt in $sword_prompts
    out $prompt"/ "
    # set -l file_list (ls $sword_prompt/$prompt/*.prompt)
    echo ls $sword_prompt/$prompt/*.prompt
    echo $file_list
    for file_list_item in $file_list
    set -l filename (file.name $file_list_item)
    set -l basename (file.base $filename)
    out "[$basename] "
    end
    out "\n"
  end
end

function prompt.set
  if arg.one $argv
    # echo $argv
    # echo "$sword_prompt/$argv.prompt"
    if file.exists "$sword_prompt/$argv.prompt"
      builtin source "$sword_prompt/$argv.prompt"
      var.global prompt (file.name $argv)".prompt"
      if fn.exists $prompt
        function fish_prompt
          eval $prompt
        end
      else
        function fish_prompt
          echo "none"
        end
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


function prompt.get
  if prompt.set
    out $prompt
  end
end
