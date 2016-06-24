describe "Gpu" do

  before(:all) do
    @api = RSpec.configuration.node.api_description['gpu']
    @system = RSpec.configuration.node.ohai_description.gpu
  end

  it "should have the correct gpu boolean value" do
    vendor_api = ""
    vendor_api = @api["gpu"] if @api
    vendor_ohai =  @system['gpu']
    vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, gpu"
  end

  it "should have the correct gpu_count" do
    if @system['gpu']
      vendor_api = ""
      vendor_api = @api['gpu_count'] if @api
      vendor_ohai = @system['gpu_count']
      vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, gpu_count"
    end
  end

  it "should have the correct gpu_model" do
    if @system['gpu']
      model_api = ""
      model_api = @api['gpu_model'] if @api
      model_ohai = @system['gpu_model']
      model_ohai.should eql(model_api), "#{model_ohai}, #{model_api}, gpu, gpu_model"
    end  
  end

  it "should have the correct gpu_vendor" do
    if @system['gpu']
      name_api = ""
      name_api = @api['gpu_vendor'] if @api
      name_ohai = @system['gpu_vendor']
      name_ohai.should eql(name_api), "#{name_ohai}, #{name_api}, gpu, gpu_vendor"
    end
  end

end
