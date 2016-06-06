describe "Gpu" do

  before(:all) do
    @api_desc = RSpec.configuration.node.api_description["gpus"]
    @api = {}
    if @api_desc
      @api_desc.each { |a|
        @api[a['name']] = a
      }
    end
  end

  RSpec.configuration.node.ohai_description[:gpu][:gpus].each do |name, dev|
    it "should have the correct vendor" do
      vendor_api = ""
      vendor_api = @api[dev[0]]['vendor'] if @api_desc
      vendor_ohai = dev[:vendor]
      vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpus, #{name}, vendor"
    end

    it "should have the correct model" do
      model_api = ""
      model_api = @api[dev[0]]['model'] if @api_desc
      model_ohai = dev[:model]
      model_ohai.should eql(model_api), "#{model_ohai}, #{model_api}, gpus, #{name}, model"
    end

    it "should have the correct name" do
      name_api = ""
      name_api = @api[dev[0]]['name'] if @api_desc
      name_ohai = dev[:name]
      name_ohai.should eql(name_api), "#{name_ohai}, #{name_api}, gpus, #{name}, name"
    end

    it "should have the correct cuda_driver_runtime_version" do
      cuda_driver_runtime_version_api = ""
      cuda_driver_runtime_version_api = @api[dev[0]]['cuda_driver_runtime_version'] if @api_desc
      cuda_driver_runtime_version_ohai = dev[:cuda_driver_runtime_version]
      cuda_driver_runtime_version_ohai.should eql(cuda_driver_runtime_version_api), "#{cuda_driver_runtime_version_ohai}, #{cuda_driver_runtime_version_api}, gpus, #{name}, cuda_driver_runtime_version"
    end

    it "should have the correct cuda_capability_major_minor_version_number" do
      cuda_capability_major_minor_version_number_api = ""
      cuda_capability_major_minor_version_number_api = @api[dev[0]]['cuda_capability_major_minor_version_number'] if @api_desc
      cuda_capability_major_minor_version_number_ohai = dev[:cuda_capability_major_minor_version_number]
      cuda_capability_major_minor_version_number_ohai.should eql(cuda_capability_major_minor_version_number_api), "#{cuda_capability_major_minor_version_number_ohai}, #{cuda_capability_major_minor_version_number_api}, gpus, #{name}, cuda_capability_major_minor_version_number"
    end

    it "should have the correct global_memory_total" do
      global_memory_total_api = ""
      global_memory_total_api = @api[dev[0]]['global_memory_total'] if @api_desc
      global_memory_total_ohai = dev[:global_memory_total]
      global_memory_total_ohai.should eql(global_memory_total_api), "#{global_memory_total_ohai}, #{global_memory_total_api}, gpus, #{name}, global_memory_total"
    end

    it "should have the correct cuda_cores" do
      cuda_cores_api = ""
      cuda_cores_api = @api[dev[0]]['cuda_cores'] if @api_desc
      cuda_cores_ohai = dev[:cuda_cores]
      cuda_cores_ohai.should eql(cuda_cores_api), "#{cuda_cores_ohai}, #{cuda_cores_api}, gpus, #{name}, cuda_cores"
    end

    it "should have the correct gpu_max_clock" do
      gpu_max_clock_api = ""
      gpu_max_clock_api = @api[dev[0]]['gpu_max_clock'] if @api_desc
      gpu_max_clock_ohai = dev[:gpu_max_clock]
      gpu_max_clock_ohai.should eql(gpu_max_clock_api), "#{gpu_max_clock_ohai}, #{gpu_max_clock_api}, gpus, #{name}, gpu_max_clock"
    end

    it "should have the correct memory_clock" do
      memory_clock_api = ""
      memory_clock_api = @api[dev[0]]['memory_clock'] if @api_desc
      memory_clock_ohai = dev[:memory_clock]
      memory_clock_ohai.should eql(memory_clock_api), "#{memory_clock_ohai}, #{memory_clock_api}, gpus, #{name}, memory_clock"
    end

    it "should have the correct memory_bus_width" do
      memory_bus_width_api = ""
      memory_bus_width_api = @api[dev[0]]['memory_bus_width'] if @api_desc
      memory_bus_width_ohai = dev[:memory_bus_width]
      memory_bus_width_ohai.should eql(memory_bus_width_api), "#{memory_bus_width_ohai}, #{memory_bus_width_api}, gpus, #{name}, memory_bus_width"
    end

    it "should have the correct l2_cache_size" do
      l2_cache_size_api = ""
      l2_cache_size_api = @api[dev[0]]['l2_cache_size'] if @api_desc
      l2_cache_size_ohai = dev[:l2_cache_size]
      l2_cache_size_ohai.should eql(l2_cache_size_api), "#{l2_cache_size_ohai}, #{l2_cache_size_api}, gpus, #{name}, l2_cache_size"
    end

    it "should have the correct max_texture_dimension_size" do
      max_texture_dimension_size_api = ""
      max_texture_dimension_size_api = @api[dev[0]]['max_texture_dimension_size'] if @api_desc
      max_texture_dimension_size_ohai = dev[:max_texture_dimension_size]
      max_texture_dimension_size_ohai.should eql(max_texture_dimension_size_api), "#{max_texture_dimension_size_ohai}, #{max_texture_dimension_size_api}, gpus, #{name}, max_texture_dimension_size"
    end

    it "should have the correct max_layered_1d_texture_size_and_layers" do
      max_layered_1d_texture_size_and_layers_api = ""
      max_layered_1d_texture_size_and_layers_api = @api[dev[0]]['max_layered_1d_texture_size_and_layers'] if @api_desc
      max_layered_1d_texture_size_and_layers_ohai = dev[:max_layered_1d_texture_size_and_layers]
      max_layered_1d_texture_size_and_layers_ohai.should eql(max_layered_1d_texture_size_and_layers_api), "#{max_layered_1d_texture_size_and_layers_ohai}, #{max_layered_1d_texture_size_and_layers_api}, gpus, #{name}, max_layered_1d_texture_size_and_layers"
    end

    it "should have the correct max_layered_2d_texture_size_and_layers" do
      max_layered_2d_texture_size_and_layers_api = ""
      max_layered_2d_texture_size_and_layers_api = @api[dev[0]]['max_layered_2d_texture_size_and_layers'] if @api_desc
      max_layered_2d_texture_size_and_layers_ohai = dev[:max_layered_2d_texture_size_and_layers]
      max_layered_2d_texture_size_and_layers_ohai.should eql(max_layered_2d_texture_size_and_layers_api), "#{max_layered_2d_texture_size_and_layers_ohai}, #{max_layered_2d_texture_size_and_layers_api}, gpus, #{name}, max_layered_2d_texture_size_and_layers"
    end

    it "should have the correct constant_memory_total" do
      constant_memory_total_api = ""
      constant_memory_total_api = @api[dev[0]]['constant_memory_total'] if @api_desc
      constant_memory_total_ohai = dev[:constant_memory_total]
      constant_memory_total_ohai.should eql(constant_memory_total_api), "#{constant_memory_total_ohai}, #{constant_memory_total_api}, gpus, #{name}, constant_memory_total"
    end

    it "should have the correct per_block_shared_memory_total" do
      per_block_shared_memory_total_api = ""
      per_block_shared_memory_total_api = @api[dev[0]]['per_block_shared_memory_total'] if @api_desc
      per_block_shared_memory_total_ohai = dev[:per_block_shared_memory_total]
      per_block_shared_memory_total_ohai.should eql(per_block_shared_memory_total_api), "#{per_block_shared_memory_total_ohai}, #{per_block_shared_memory_total_api}, gpus, #{name}, per_block_shared_memory_total"
    end

    it "should have the correct per_block_available_registers" do
      per_block_available_registers_api = ""
      per_block_available_registers_api = @api[dev[0]]['per_block_available_registers'] if @api_desc
      per_block_available_registers_ohai = dev[:per_block_available_registers]
      per_block_available_registers_ohai.should eql(per_block_available_registers_api), "#{per_block_available_registers_ohai}, #{per_block_available_registers_api}, gpus, #{name}, per_block_available_registers"
    end

    it "should have the correct warp_size" do
      warp_size_api = ""
      warp_size_api = @api[dev[0]]['warp_size'] if @api_desc
      warp_size_ohai = dev[:warp_size]
      warp_size_ohai.should eql(warp_size_api), "#{warp_size_ohai}, #{warp_size_api}, gpus, #{name}, warp_size"
    end

    it "should have the correct per_multiprocess_max_threads" do
      per_multiprocess_max_threads_api = ""
      per_multiprocess_max_threads_api = @api[dev[0]]['per_multiprocess_max_threads'] if @api_desc
      per_multiprocess_max_threads_ohai = dev[:per_multiprocess_max_threads]
      per_multiprocess_max_threads_ohai.should eql(per_multiprocess_max_threads_api), "#{per_multiprocess_max_threads_ohai}, #{per_multiprocess_max_threads_api}, gpus, #{name}, per_multiprocess_max_threads"
    end

    it "should have the correct per_block_max_threads" do
      per_block_max_threads_api = ""
      per_block_max_threads_api = @api[dev[0]]['per_block_max_threads'] if @api_desc
      per_block_max_threads_ohai = dev[:per_block_max_threads]
      per_block_max_threads_ohai.should eql(per_block_max_threads_api), "#{per_block_max_threads_ohai}, #{per_block_max_threads_api}, gpus, #{name}, per_block_max_threads"
    end

    it "should have the correct thread_block_max_dimension" do
      thread_block_max_dimension_api = ""
      thread_block_max_dimension_api = @api[dev[0]]['thread_block_max_dimension'] if @api_desc
      thread_block_max_dimension_ohai = dev[:thread_block_max_dimension]
      thread_block_max_dimension_ohai.should eql(thread_block_max_dimension_api), "#{thread_block_max_dimension_ohai}, #{thread_block_max_dimension_api}, gpus, #{name}, thread_block_max_dimension"
    end

    it "should have the correct grid_size_max_dimension" do
      grid_size_max_dimension_api = ""
      grid_size_max_dimension_api = @api[dev[0]]['grid_size_max_dimension'] if @api_desc
      grid_size_max_dimension_ohai = dev[:grid_size_max_dimension]
      grid_size_max_dimension_ohai.should eql(grid_size_max_dimension_api), "#{grid_size_max_dimension_ohai}, #{grid_size_max_dimension_api}, gpus, #{name}, grid_size_max_dimension"
    end

    it "should have the correct max_memory_pitch" do
      max_memory_pitch_api = ""
      max_memory_pitch_api = @api[dev[0]]['max_memory_pitch'] if @api_desc
      max_memory_pitch_ohai = dev[:max_memory_pitch]
      max_memory_pitch_ohai.should eql(max_memory_pitch_api), "#{max_memory_pitch_ohai}, #{max_memory_pitch_api}, gpus, #{name}, max_memory_pitch"
    end

    it "should have the correct texture_alignment" do
      texture_alignment_api = ""
      texture_alignment_api = @api[dev[0]]['texture_alignment'] if @api_desc
      texture_alignment_ohai = dev[:texture_alignment]
      texture_alignment_ohai.should eql(texture_alignment_api), "#{texture_alignment_ohai}, #{texture_alignment_api}, gpus, #{name}, texture_alignment"
    end

    it "should have the correct concurrent_copy_and_kernel_execution" do
      concurrent_copy_and_kernel_execution_api = ""
      concurrent_copy_and_kernel_execution_api = @api[dev[0]]['concurrent_copy_and_kernel_execution'] if @api_desc
      concurrent_copy_and_kernel_execution_ohai = dev[:concurrent_copy_and_kernel_execution]
      concurrent_copy_and_kernel_execution_ohai.should eql(concurrent_copy_and_kernel_execution_api), "#{concurrent_copy_and_kernel_execution_ohai}, #{concurrent_copy_and_kernel_execution_api}, gpus, #{name}, concurrent_copy_and_kernel_execution"
    end

    it "should have the correct kernel_runtime_limit" do
      kernel_runtime_limit_api = ""
      kernel_runtime_limit_api = @api[dev[0]]['kernel_runtime_limit'] if @api_desc
      kernel_runtime_limit_ohai = dev[:kernel_runtime_limit]
      kernel_runtime_limit_ohai.should eql(kernel_runtime_limit_api), "#{kernel_runtime_limit_ohai}, #{kernel_runtime_limit_api}, gpus, #{name}, kernel_runtime_limit"
    end

    it "should have the correct integrated_gpu_sharing_host_memory" do
      integrated_gpu_sharing_host_memory_api = ""
      integrated_gpu_sharing_host_memory_api = @api[dev[0]]['integrated_gpu_sharing_host_memory'] if @api_desc
      integrated_gpu_sharing_host_memory_ohai = dev[:integrated_gpu_sharing_host_memory]
      integrated_gpu_sharing_host_memory_ohai.should eql(integrated_gpu_sharing_host_memory_api), "#{integrated_gpu_sharing_host_memory_ohai}, #{integrated_gpu_sharing_host_memory_api}, gpus, #{name}, integrated_gpu_sharing_host_memory"
    end

    it "should have the correct host_page_locked_memory_mapping_support" do
      host_page_locked_memory_mapping_support_api = ""
      host_page_locked_memory_mapping_support_api = @api[dev[0]]['host_page_locked_memory_mapping_support'] if @api_desc
      host_page_locked_memory_mapping_support_ohai = dev[:host_page_locked_memory_mapping_support]
      host_page_locked_memory_mapping_support_ohai.should eql(host_page_locked_memory_mapping_support_api), "#{host_page_locked_memory_mapping_support_ohai}, #{host_page_locked_memory_mapping_support_api}, gpus, #{name}, host_page_locked_memory_mapping_support"
    end

    it "should have the correct alignment_requirement_for_surfaces" do
      alignment_requirement_for_surfaces_api = ""
      alignment_requirement_for_surfaces_api = @api[dev[0]]['alignment_requirement_for_surfaces'] if @api_desc
      alignment_requirement_for_surfaces_ohai = dev[:alignment_requirement_for_surfaces]
      alignment_requirement_for_surfaces_ohai.should eql(alignment_requirement_for_surfaces_api), "#{alignment_requirement_for_surfaces_ohai}, #{alignment_requirement_for_surfaces_api}, gpus, #{name}, alignment_requirement_for_surfaces"
    end

    it "should have the correct device_ecc_support" do
      device_ecc_support_api = ""
      device_ecc_support_api = @api[dev[0]]['device_ecc_support'] if @api_desc
      device_ecc_support_ohai = dev[:device_ecc_support]
      device_ecc_support_ohai.should eql(device_ecc_support_api), "#{device_ecc_support_ohai}, #{device_ecc_support_api}, gpus, #{name}, device_ecc_support"
    end

    it "should have the correct device_uva_support" do
      device_uva_support_api = ""
      device_uva_support_api = @api[dev[0]]['device_uva_support'] if @api_desc
      device_uva_support_ohai = dev[:device_uva_support]
      device_uva_support_ohai.should eql(device_uva_support_api), "#{device_uva_support_ohai}, #{device_uva_support_api}, gpus, #{name}, device_uva_support"
    end

  end
end
