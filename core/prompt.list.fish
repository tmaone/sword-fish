function prompt.list
  for prompt in $sword_prompts
    out $prompt"/ "
    set -l file_list (ls $sword_prompt/$prompt/*.prompt)
    # echo ls $sword_prompt/$prompt/*.prompt
    # echo $file_list
    for file_list_item in $file_list
    set -l filename (file.name $file_list_item)
    set -l basename (file.base $filename)
    out "[$basename] "
    end
    out "\n"
  end
end
