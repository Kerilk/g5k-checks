provides "gpu"

gpu_output = `lspci | grep 3D`
#gpu_output = "05:00.0 3D controller: NVIDIA Corporation GK210GL [Tesla K80] (rev a1)\n06:00.0 3D controller: NVIDIA Corporation GK210GL [Tesla K80] (rev a1)\n"
#gpu_output = "03:00.0 3D controller: NVIDIA Corporation Device 17fd (rev a1)"

if gpu_output != ''
  gpu_lines = gpu_output.split("\n")
  gpu_count = 0
  gpu_vendor = 'Unknown'
  gpu_model = 'Unknown'

  gpu_lines.each { |line|
    begin
      gpu_model_info = line[/\[.*\]/]
      gpu_model_info['['] = ''
      gpu_model_info[']'] = ''

      gpu_model = gpu_model_info.split(' ')[-1]
    rescue
      if not line['17fd'].nil?
        gpu_model = 'M40'
      end
    end

    if line['NVIDIA']
      gpu_vendor = 'NVIDIA'
    elsif line['AMD']
      gpu_vendor = 'AMD'
    end

    if gpu_model
      gpu_count += 1
    end
  }
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

devicequery_path = '/usr/local/cuda/samples/bin/x86_64/linux/release/deviceQuery'
if Pathname.new(devicequery_path).executable?
  nvidia_output = `#{devicequery_path}`
  if nvidia_output != ''
    nvidia_lines = nvidia_output.split("\n")
    nvidia_lines.each do |line|
      if line =~ /^Device [0-9]: "Tesla ([A-Za-z0-9]+)-PCIE-[0-9]+GB/
        gpu_model = $1
      end
    end
    gpu_info[:gpu_model] = gpu_model
  end
end

gpu gpu_info
