function log.init

  if not set -q log_filename
    set -xg log_filename  'sword-fish.log'
  end

  if not set -q log_path
    set -xg log_path $sword_root/log
    if not test -d $log_path
      mkdir -p $log_path
    end
  end

  if not set -q sword_log_file
    set -xg sword_log_file $log_path/$log_filename
    if not test -f $sword_log_file
      touch $sword_log_file
    end
  end

  if not set -q log_level
    set -xU log_level info
  else
    log.level (log.level)
  end

  # if not set -q log_error_prompt
  #   var.global log_error_prompt "┠"(color $color_error) !(color $color_normal)
  # end
  #
  # if not set -q log_info_prompt
  #   var.global log_info_prompt "┠"(color $color_info) !(color $color_normal)
  # end
  #
  # if not set -q log_warn_prompt
  #   var.global log_warn_prompt "┠"(color $color_warn) !(color $color_normal)
  # end
  #
  # if not set -q log_debug_prompt
  #   var.global log_debug_prompt "┠"(color $color_debug) !(color $color_normal)
  # end
  #
  # if not set -q log_out_prompt
  #   var.global log_out_prompt "┠"(color $color_normal) (progress)(color $color_normal)
  # end

end

#ʘ❩º✇♁♁♀♂♁✧✙✚◎◉⦿☐■▪︎◼︎◻︎▶︎✦✧✩✔︎✖︎⨀⊙⦿⁞⁝⁜⁛⁚⁙⁘⁖⁕⁔⁓⁒⁑⁐⁂‼※›‹‸‷‶‴‣•‡†‗‖↪↩↻↺∞∴∵∷∶─━│┃┄┅┆┇┉┋
# echo (red) "⁐" (normal) "$argv"(red) .(normal)

# var.global color_normal $color_whitesmoke
# var.global color_info 	$color_gray
# var.global color_warn 	$color_palegoldenrod
# var.global color_error 	$color_crimson
# var.global color_debug 	$color_darkorange
