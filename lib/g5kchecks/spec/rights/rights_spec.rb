describe "Rights on /tmp" do

  it "should have mode 41777" do
    tmp_mode = File.stat("/tmp").mode.to_s(8)
    tmp_mode.should eql("41777"), "/tmp mode to #{tmp_mode} instead of 41777"
  end

end

describe "Sudo rights" do
  it "should not use sudo-g5k" do
    exist = File.exist?("/etc/sudoers.d/allowed_by_g5ksudo")
    exist.should eql(false), "User used sudo-g5k"
  end
end
