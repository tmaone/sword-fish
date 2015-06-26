function var.set
  if arg.two $argv
    var.global $argv[1] $argv[2..-1]
    echo $argv[1] "--" "$argv[2..-1]"
  end
end
