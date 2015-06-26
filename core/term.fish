function term.init
  find.program tput
  find.program stty
end

function term

end

function term.size
  stty size
end

function term.columns
  tput cols
end

function term.lines
  tput lines
end

function term.colors
  tput colors
end

function term.bell
  tput bel
end

function term.blink
  tput blink
end

function term.bold
  tput bold
end

function term.underline
  tput smul
end

function term.reverse
  tput rev
end

function term.invisible
  tput civis
end

function term.visible
  tput cvvis
end

function term.invisibletext
  tput invis
end

function term.back
  tput cbt
end

function term.clear
  tput clear
end

function term.normal
  tput cnorm
end

function term.ret
  tput cr
end

function term.ret
  tput cr
end

function term.dim
  tput dim
end

function term.flash
  tput flash
end

function term.print
  tput mc0
end

function term.last
  tput rc
end

function term.save
  tput sc
end

function term.line
  tput vpa $argv
end

function term.column
  tput hpa $argv
end

function term.move
  tput cup $argv
end

function term.moveleft
  tput cub $argv
end

function term.moveright
  tput cuf $argv
end

function term.window
  tput wind
end

function term.up
  tput cuu1
end

function term.erase
  tput ech $argv
end

function term.insert.char
  tput ich $argv
end

function term.insert.line
  tput il $argv
end
