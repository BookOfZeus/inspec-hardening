#
control 'software-01' do
  title 'Check for inetd or xinetd'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('inetd') do
    it { should_not be_installed }
  end
  describe package('xinetd') do
    it { should_not be_installed }
  end
end

#
control 'software-02' do
  title 'Check for Telnet server'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('telnetd') do
    it { should_not be_installed }
  end
end

control 'software-03' do
  impact 1.0
  title 'Check for rsh server'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('rsh-server') do
    it { should_not be_installed }
  end
  describe package('rsh-redone-server') do
    it { should_not be_installed }
  end
end

control 'software-04' do
  impact 1.0
  title 'Check for ypserv server (NIS)'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('ypserv') do
    it { should_not be_installed }
  end
end

control 'software-05' do
  impact 1.0
  title 'Check for tftp server'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('tftp-server') do
    it { should_not be_installed }
  end
  describe package('tftpd') do
    it { should_not be_installed }
  end
  describe package('atftpd') do
    it { should_not be_installed }
  end
  describe package('tftpd-hpa') do
    it { should_not be_installed }
  end
end

control 'software-06' do
  impact 1.0
  title 'Check for additional software'
  desc 'Make sure we do not have unwanted software / packages'
  describe package('yp-tools') do
    it { should_not be_installed }
  end
  describe package('prelink') do
    it { should_not be_installed }
  end
end
