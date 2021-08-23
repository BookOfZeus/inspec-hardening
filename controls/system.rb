#
control 'system-01' do
  title 'Hosts login'
  desc "Make sure we don't have a weak implementation of authentication."
  describe file('/etc/hosts.equiv') do
    it { should_not exist }
  end
end

#
control 'system-02' do
  title 'Check for /etc/shadow'
  desc 'Make sure we check for the /etc/shadow permissions'
  describe file('/etc/shadow') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should_not be_executable }
    it { should_not be_readable.by('other') }
  end

  describe file('/etc/shadow') do
    it { should be_readable.by('group') }
  end
end

#
control 'system-03' do
  title 'Check for /etc/passwd'
  desc 'Make sure we check for the /etc/passwd permissions'
  describe file('/etc/passwd') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
  end
end

#
control 'system-04' do
  title '. in PATH variable'
  desc 'Do not include the current working directory in PATH variable.'
  describe os_env('PATH') do
    its('split') { should_not include('') }
    its('split') { should_not include('.') }
  end
end

#
control 'system-05' do
  title 'Check for /etc/login.defs'
  desc 'Also check the configured PATH variable and umask in login.defs'
  describe file('/etc/login.defs') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should_not be_executable }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
    it { should_not be_writable }
  end
  describe login_defs do
    its('ENV_SUPATH') { should include('/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin') }
    its('ENV_PATH') { should include('/usr/local/bin:/usr/bin:/bin') }
    its('UMASK') { should eq "022" }
    its('PASS_MAX_DAYS') { should eq "60" }
    its('PASS_MIN_DAYS') { should eq "7" }
    its('PASS_WARN_AGE') { should eq "7" }
    its('LOGIN_RETRIES') { should eq '5' }
    its('LOGIN_TIMEOUT') { should eq '60' }
    its('UID_MIN') { should eq '1000' }
    its('GID_MIN') { should eq '1000' }
    its('SYS_UID_MIN') { should eq '201' }
    its('SYS_UID_MAX') { should eq '999' }
    its('SYS_GID_MIN') { should eq '201' }
    its('SYS_GID_MAX') { should eq '999' }
  end
end

#
# blacklist = attribute(
#   'blacklist',
#   value: suid_blacklist.default,
#   description: 'blacklist of suid/sgid program on system'
# )
#
# #
# control 'system-06' do
#   impact 1.0
#   title 'Check for SUID / SGID blacklist'
#   desc 'Find blacklisted SUID and SGID files'
#
#   describe suid_check(blacklist) do
#     its('diff') { should be_empty }
#   end
# end

#
control 'system-07' do
  title 'Check for /proc/sys/kernel/random/entropy_avail'
  desc 'Check system has enough entropy, aka, greater than 1000'
  describe file('/proc/sys/kernel/random/entropy_avail').content.to_i do
    it { should >= 1000 }
  end
end

#
control 'system-08' do
  title 'Check for .rhosts & .netrc file'
  desc 'Find .rhosts and .netrc files'
  output = command('find / -maxdepth 3 \( -iname .rhosts -o -iname .netrc \) -print 2>/dev/null | grep -v \'^find:\'')
  out = output.stdout.split(/\r?\n/)
  describe out do
    it { should be_empty }
  end
end

#
control 'system-09' do
  title 'Protect log-directory'
  desc 'The log-directory /var/log should belong to root'
  describe file('/var/log') do
    it { should be_directory }
    it { should be_owned_by 'root' }
    its(:group) { should match(/^root|syslog$/) }
  end
end

#
cpuvulndir = '/sys/devices/system/cpu/vulnerabilities/'

control 'system-10' do
  title 'Detect vulnerabilities in the cpu-vulnerability-directory'
  desc 'Check for known cpu vulnerabilities described here: https://www.kernel.org/doc/html/v5.6/admin-guide/hw-vuln/index.html'

  describe file(cpuvulndir) do
    it { should be_directory }
  end

  loaded_files = command("find #{cpuvulndir} -type f -maxdepth 1").stdout.split(/\n/).map(&:strip).find_all { |vulnfiles| !vulnfiles.empty? }

  loaded_files.each do |vulnfile|
    describe file(vulnfile) do
      its(:content) { should_not match 'vulnerable' }
      its(:content) { should_not match 'Vulnerable' }
    end
  end
end

#
control 'system-11' do
  impact 1.0
  title 'Protect cron directories and files'
  desc 'The cron directories and files should belong to root.'

  cron_files = ['/etc/crontab', '/etc/cron.hourly', '/etc/cron.daily', '/etc/cron.weekly', '/etc/cron.monthly', '/etc/cron.d']

  cron_files.each do |cron_file|
    next unless file(cron_file).exist?

    describe file(cron_file) do
      it { should be_owned_by 'root' }
      it { should_not be_writable.by('group') }
      it { should_not be_writable.by('other') }
      it { should_not be_readable.by('group') }
      it { should_not be_readable.by('other') }
    end
  end
end
