function cpu

end

function cpu.bandwith
  dd if=/dev/zero of=/dev/null bs=1m count=32768
end
