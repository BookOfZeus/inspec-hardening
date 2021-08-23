#
control "server-01" do
  title "Fix Openssl Heartbleed"
  desc "Check for Openssl Heartbleed"
  describe command('openssl version -b') do
    its('stdout') { should_not eq '1.0.1' }
    its('stdout') { should_not eq '1.0.1a' }
    its('stdout') { should_not eq '1.0.1b' }
    its('stdout') { should_not eq '1.0.1c' }
    its('stdout') { should_not eq '1.0.1d' }
    its('stdout') { should_not eq '1.0.1e' }
    its('stdout') { should_not eq '1.0.1f' }
  end
end

#
control 'server-02' do
  title 'Secure Console'
  desc 'Check for Secure Console'
  describe file('/etc/securetty') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end