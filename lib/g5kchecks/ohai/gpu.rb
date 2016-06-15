provides "gpu"

gpu_info = Mash.new

gpu_info[:gpus] = {}

gpu_output = `lspci | grep 3D`
# gpu_output = "05:00.0 3D controller: NVIDIA Corporation GK210GL [Tesla K80] (rev a1)\n06:00.0 3D controller: NVIDIA Corporation GK210GL [Tesla K80] (rev a1)\n"

if gpu_output != ''
  gpu_lines = gpu_output.split("\n")
  gpu_count = 0
  gpu_vendor = 'Unknown'
  gpu_model = 'Unknown'

  for line in gpu_lines
    gpu_model_info = line[/\[.*\]/]
    gpu_model_info['['] = ''
    gpu_model_info[']'] = ''

    gpu_model = gpu_model_info.split(' ')[-1]

    if line['NVIDIA']
      gpu_vendor = 'NVIDIA'
    elsif line['AMD']
      gpu_vendor = 'AMD'
    end

    if gpu_model
      gpu_count += 1
    end
  end
  gpu_info = {
      :gpu => true,
      :gpu_model => gpu_model,
      :gpu_vendor => gpu_vendor,
      :gpu_count => gpu_count
  }
else
  gpu_info = {
      :gpu => false
  }
end

gpu gpu_info
