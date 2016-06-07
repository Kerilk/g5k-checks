provides "gpu"

gpuinfo = Mash.new

gpuinfo[:gpus] = {}

@labels_map = {
    "Vendor" => "vendor",
    "Name" => "name",
    "Model" => "model",
    "CUDA Driver Version / Runtime Version"=> "cuda_driver_runtime_version",
    "CUDA Capability Major/Minor version number"=> "cuda_capability_major_minor_version_number",
    "Total amount of global memory"=> "global_memory_total",
    "(13) Multiprocessors, (192) CUDA Cores/MP"=> "cuda_cores",
    "GPU Max Clock rate"=> "gpu_max_clock",
    "Memory Clock rate"=> "memory_clock",
    "Memory Bus Width"=> "memory_bus_width",
    "L2 Cache Size"=> "l2_cache_size",
    "Maximum Texture Dimension Size (x,y,z)"=> "max_texture_dimension_size",
    "Maximum Layered 1D Texture Size, (num) layers"=> "max_layered_1d_texture_size_and_layers",
    "Maximum Layered 2D Texture Size, (num) layers"=> "max_layered_2d_texture_size_and_layers",
    "Total amount of constant memory"=> "constant_memory_total",
    "Total amount of shared memory per block"=> "per_block_shared_memory_total",
    "Total number of registers available per block"=> "per_block_available_registers",
    "Warp size"=> "warp_size",
    "Maximum number of threads per multiprocessor"=> "per_multiprocess_max_threads",
    "Maximum number of threads per block"=> "per_block_max_threads",
    "Max dimension size of a thread block (x,y,z)"=> "thread_block_max_dimension",
    "Max dimension size of a grid size    (x,y,z)"=> "grid_size_max_dimension",
    "Maximum memory pitch"=> "max_memory_pitch",
    "Texture alignment"=> "texture_alignment",
    "Concurrent copy and kernel execution"=> "concurrent_copy_and_kernel_execution",
    "Run time limit on kernels"=> "kernel_runtime_limit",
    "Integrated GPU sharing Host Memory"=> "integrated_gpu_sharing_host_memory",
    "Support host page-locked memory mapping"=> "host_page_locked_memory_mapping_support",
    "Alignment requirement for Surfaces"=> "alignment_requirement_for_surfaces",
    "Device has ECC support"=> "device_ecc_support",
    "Device supports Unified Addressing (UVA)"=> "device_uva_support",
    "Device PCI Domain ID / Bus ID / location ID" => "device_pcid_busid_locationid"
}

def generate_gpu_conf
  result = {}
  @labels_map.each do |key, val|
    result[val] = nil
  end
  return result
end

def get_matching_rule line
  @labels_map.each do |key, val|
    if line.include? key
      return key
    end
  end
  return nil
end

def extract_value line, property
  if property == "Name"
    s = line.split(":")[0]
    s = s.gsub("\"", "")
    return s.strip()
  elsif property == "Model"
      s = line.split(":")[1]
      s = s.gsub("\"", "")
      return s.strip()
  else
    value = line.split(property)[-1].strip()
    if (value =~%r":") == 0
      value = value.gsub(/^:[ ]*/, "")
    end
    return value
  end
end

# The <nvidia_file_name> variables is a link to a file containing the
# output of the "deviceQuery" sample, provided by the CUDA framework.
nvidia_file_name = "/opt/nvidia.txt"

if File.exist?(nvidia_file_name)
  file_nvidia = File.open(nvidia_file_name)
  file_nvidia_content = file_nvidia.read
  file_nvidia.close
  gpu_name = nil
  file_nvidia_content.each_line do |line|
    if /Device [0-9]+:/.match(line)
      gpu_description = generate_gpu_conf()
      name = extract_value(line, "Name")
      model = extract_value(line, "Model")
      gpu_description[:name] = name
      gpu_description[:model] = model
      gpu_description[:vendor] = "NVIDIA"
      gpu_name = name
      gpuinfo[:gpus][gpu_name] = gpu_description
    elsif not gpu_name.nil?
      key = get_matching_rule(line)
      if not key.nil?
        simplified_key = @labels_map[key]
        puts(simplified_key)
        value = extract_value(line, key)
        gpu_description = gpuinfo[:gpus][gpu_name]
        gpu_description[simplified_key] = value
      else
        # Value could not be parsed: we skip it
      end
    end
  end
end

gpu gpuinfo
