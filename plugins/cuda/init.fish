set cuda_path "/Developer/NVIDIA/CUDA-7.0/bin" "/usr/local/cuda/bin"

for path in $cuda_path
  if dir.exists $path
    if not path.contains $path
      path.add  $path
    end
  end
end
