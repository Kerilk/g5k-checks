require 'yaml'

module G5kChecks
  class ConfigParser

    def initialize(configpath)
      # The config path
      @path = configpath
      # Hash to be return after the file parsing
      @hash = {}
    end

    def parse
      begin
        config = YAML.load_file(@path)
      rescue ArgumentError
        raise ArgumentError.new("Invalid YAML file '#{@path}'")
      rescue Errno::ENOENT
        raise ArgumentError.new("File not found '#{@path}'")
      end
      @hash[:checks_for_init_dir] = config["checks_for_init_dir"]
      @hash[:testlist] = config["checks_for_oar"].split(',') if config["checks_for_oar"]
      return @hash
    end
  end
end