describe "Memory" do

  before do
    @api = RSpec.configuration.node.api_description['main_memory']
  end

  it "should have the correct size" do
    size_api = 0
    size_api = @api['ram_size'].to_i if @api
    size_sys = Utils.hwloc_parse_mem
    err = ((size_sys-size_api)/size_api.to_f).abs
    err.should be < 0.15, "#{size_sys}, #{size_api}, main_memory, ram_size"
  end

end
