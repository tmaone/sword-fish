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
