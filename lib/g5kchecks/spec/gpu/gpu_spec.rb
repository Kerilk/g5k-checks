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

    it "should have the correct gpu boolean value" do
      vendor_api = ""
      vendor_api = @api[dev[0]]['gpu'] if @api_desc
      vendor_ohai = dev[:gpu]
      vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, #{name}, gpu"
    end

    # Skip remaining tests if there are no gpus installed on the node
    if not dev[:gpu]
      next
    end

    it "should have the correct gpu_count" do
      vendor_api = ""
      vendor_api = @api[dev[0]]['gpu_count'] if @api_desc
      vendor_ohai = dev[:gpu_count]
      vendor_ohai.should eql(vendor_api), "#{vendor_ohai}, #{vendor_api}, gpu, #{name}, gpu_count"
    end

    it "should have the correct gpu_model" do
      model_api = ""
      model_api = @api[dev[0]]['gpu_model'] if @api_desc
      model_ohai = dev[:gpu_model]
      model_ohai.should eql(model_api), "#{model_ohai}, #{model_api}, gpu, #{name}, gpu_model"
    end

    it "should have the correct gpu_vendor" do
      name_api = ""
      name_api = @api[dev[0]]['gpu_vendor'] if @api_desc
      name_ohai = dev[:gpu_vendor]
      name_ohai.should eql(name_api), "#{name_ohai}, #{name_api}, gpu, #{name}, gpu_vendor"
    end

  end
end
