


#
control "service-01" do
  title "Check for service: at"
  desc "Check to make sure the service is disabled"
  describe service('at') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-02" do
  title "Check for service: anacron"
  desc "Check to make sure the service is disabled"
  describe service('anacron') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-03" do
  title "Check for service: apport"
  desc "Check to make sure the service is disabled"
  describe service('apport') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-04" do
  title "Check for service: bluetooth"
  desc "Check to make sure the service is disabled"
  describe service('bluetooth') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-05" do
  title "Check for service: avahi-daemon"
  desc "Check to make sure the service is disabled"
  describe service('avahi-daemon') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control 'service-06' do
  title 'ctrl+alt+del'
  desc 'Check for ctrl+alt+del'
  describe file('/etc/systemd/system/ctrl-alt-del.target') do
    it { should exist }
    it { should be_symlink }
    it { should be_linked_to '/dev/null' }
  end
end

#
control "service-07" do
  title "Check for service: cups"
  desc "Check to make sure the service is disabled"
  describe service('cups') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-08" do
  title "Check for service: telnetd"
  desc "Check to make sure the service is disabled"
  describe service('telnetd') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-09" do
  title "Check for service: whoopsie"
  desc "Check to make sure the service is disabled"
  describe service('whoopsie') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-10" do
  title "Check for service: zeitgeist"
  desc "Check to make sure the service is disabled"
  describe service('zeitgeist') do
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

#
control "service-11" do
  title "Check for service: ufw"
  desc "Check to make sure the service is disabled"
  describe service('ufw') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end