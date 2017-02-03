provides "dmi/improve"
require_plugin("dmi")
require_plugin("kernel")

instruction_set = kernel[:machine].sub('_','-')
if instruction_set == 'aarch64'
  dmi[:bios] = {}
  dmi[:system] = {}

  popen4("lshw -quiet -c memory -disable memory") do |pid, stdin, stdout, stderr|
    stdin.close
    stdout.each do |line|
      if line =~ /product/
        dmi[:bios][:version] = line.chomp.split(": ").last.lstrip
      end
      if line =~ /version/
        dmi[:bios][:release_date] = line.chomp.split(": ").last.lstrip
      end
    end
  end

  popen4("lshw -quiet -c system") do |pid, stdin, stdout, stderr|
    stdin.close
    stdout.each do |line|
      if line =~ /vendor/
        vendor = line.chomp.split(": ").last.lstrip
        if vendor == 'Hewlett-Packard Development Company, L.P.'
          vendor = 'HP'
        end
        dmi[:bios][:vendor] = dmi[:system][:manufacturer] = vendor
      end
      if line =~ /product/
        dmi[:system][:product_name] = line.chomp.split(": ").last.lstrip
      end
      if line =~ /serial/
        dmi[:system][:serial_number] = line.chomp.split(": ").last.lstrip
      end
    end
  end
end
