
#
control "general-01" do
  title "Check root access"
  desc "Make sure the root access is disabled"
  describe command("if sudo passwd -S | grep -q ' L '; then echo 1; else echo 0; fi") do
    its("stdout") { should match '1' }
  end
end

#
control "general-02" do
  title "Check for Disable Shell Accounts"
  desc "Make sure the default shell accounts are disabled"
  describe command("for x in $(cat /etc/passwd | cut -d':' -f 1 | egrep -v \"$(whoami)|sync\"); do grep ^$x /etc/passwd | egrep -v '\/false|\/nologin|\/shutdown|\/halt' ; done") do
    its("stdout") { should be_empty }
  end
end

#
control "general-03" do
  title "System Updates"
  desc "Make sure system updates are enabled"
  describe file('/etc/apt/apt.conf.d/20auto-upgrades') do
    its('content') { should match("APT::Periodic::Update-Package-Lists \"1\";") }
    its('content') { should match("APT::Periodic::Unattended-Upgrade \"1\";") }
  end
end
