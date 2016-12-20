describe "Architecture" do

  before(:all) do
    @api = RSpec.configuration.node.api_description["architecture"]
    @system = RSpec.configuration.node.ohai_description
  end

  it "should have the correct platform type" do
    plat_api = ""
    plat_api = @api['platform_type'] if @api
    plat_ohai = @system[:kernel][:machine]
    plat_ohai.should eq(plat_api), "#{plat_ohai}, #{plat_api}, architecture, platform_type"
  end

  [:nb_procs, :nb_cores, :nb_threads].each { |key|

    # /!\ Warning: As some names of CPUs properties have changed in the
    # grid'5000 api: the following block ensure compatibility between
    # Chameleon and grid'5000 api
    old_api_key = nil
    if key == :nb_threads
      old_api_key = :smt_size
    elsif key == :nb_procs
      old_api_key = :smp_size
    end

    if old_api_key
      it "should have the correct value for #{old_api_key}" do
        key_ohai = @system[:cpu][key]
        key_api = @api[old_api_key.to_s] if @api

        key_ohai.should eq(key_api), "#{key_ohai}, #{key_api}, architecture, #{old_api_key}"
      end
    end
    
    it "should have the correct value for #{key}" do
      key_ohai = @system[:cpu][key]
      
      key_api = nil
      key_api = @api[key.to_s] if @api
      
      key_ohai.should eq(key_api), "#{key_ohai}, #{key_api}, architecture, #{key}"
    end
    
  }
  
end
