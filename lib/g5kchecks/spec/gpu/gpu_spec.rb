describe "Gpu" do

  @api = RSpec.configuration.node.api_description['gpu']
  @system = RSpec.configuration.node.ohai_description['gpu']

  puts @api
  # Skip remaining tests if there are no gpus installed on the node
  it "should have the correct gpu boolean value" do
    vendor_api = ""
    vendor_api = @api['gpu'] if @api
    vendor_ohai =  @system['gpu']
    vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, #{name}, gpu"
  end


  if @api['gpu']
    it "should have the correct gpu_count" do
      vendor_api = ""
      vendor_api = @api['gpu_count'] if @api
      vendor_ohai = @system['gpu_count']
      vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, #{name}, gpu_count"
    end

    it "should have the correct gpu_model" do
      model_api = ""
      model_api = @api['gpu_model'] if @api
      model_ohai = @system['gpu_model']
      model_ohai.should eql(model_api), "#{model_ohai}, #{model_api}, gpu, #{name}, gpu_model"
    end

    it "should have the correct gpu_vendor" do
      name_api = ""
      name_api = @api['gpu_vendor'] if @api
      name_ohai = @system['gpu_vendor']
      name_ohai.should eql(name_api), "#{name_ohai}, #{name_api}, gpu, #{name}, gpu_vendor"
    end
  end

end
