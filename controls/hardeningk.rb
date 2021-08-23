
#
control 'hardening-01' do
  title 'SSHD config'
  desc 'Check for ssdh config'
  describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end

control "hardening-02" do
  title "Check for SSH security"
  desc "Check to make sure the ssh is secure"
  describe sshd_config do
    its('Protocol') { should eq '2' }
    its('PermitRootLogin') { should eq "no" }
    its('PermitEmptyPasswords') { should eq "no" }
    its('PermitUserEnvironment') { should eq "no" }
    its('PrintLastLog') { should eq "no" }
    its('MaxAuthTries') { should eq "3" }
    its('LoginGraceTime') { should eq "20" }
    its('AllowAgentForwarding') { should eq "no" }
    its('AllowTcpForwarding') { should eq "no" }
    its('PermitTunnel') { should eq "no" }
    its('ChallengeResponseAuthentication') { should eq "no" }
    its('PasswordAuthentication') { should eq "no" }
    its('KerberosAuthentication') { should eq "no" }
    its('GSSAPIAuthentication') { should eq "no" }
    its('PubkeyAuthentication') { should eq "yes" }
    its('Port') { should_not eq "22" }
    its('UseDNS') { should eq "no" }
    its('ClientAliveInterval') { should eq "300" }
    its('ClientAliveCountMax') { should eq "0" }
    its('IgnoreRhosts') { should eq "yes" }
    its('RhostsAuthentication') { should eq "no" }
    its('RhostsRSAAuthentication') { should eq "no" }
    its('RSAAuthentication') { should eq "yes" }
    its('HostbasedAuthentication') { should eq "no" }
    its('LoginGraceTime') { should eq "300" }
    its('MaxStartups') { should eq "2" }
    its('AllowTcpForwarding') { should eq "no" }
    its('X11Forwarding') { should eq "no" }
    its('LogLevel') { should eq "VERBOSE" }
    its('StrictModes') { should eq "yes" }
  end
end

#
control 'hardening-03' do
  title 'Ip Spoofing'
  desc 'Check for Ip Spoofing'
  describe file('/etc/host.conf') do
    it { should exist }
    it { should be_file }
    its('content') { should match("order bind,hosts") }
    its('content') { should match("nospoof on") }
  end
end

#
control 'hardening-04' do
  title 'Disable Open DNS Recursion'
  desc 'Check for Disable Open DNS Recursion'
  describe file('/etc/bind/named.conf.options') do
    it { should exist }
    it { should be_file }
    its('content') { should match("recursion no") }
    its('content') { should match("version \"Not Disclosed\"") }
  end
end

#
control 'hardening-05' do
  title 'Firewall check'
  desc 'Check for firewall rules'
  describe file('/etc/ufw/before.rules') do
    it { should exist }
    it { should be_file }
    # Protect Ddos Attacks
    its('content') { should match(":ufw-http - [0:0]") }
    its('content') { should match(":ufw-http-logdrop - [0:0]") }

    # Limit connections per Class C
    its('content') { should match("-A ufw-http -p tcp --syn -m connlimit --connlimit-above 50 --connlimit-mask 24 -j ufw-http-logdrop") }

    # Limit packets per IP
    its('content') { should match("-A ufw-http -m recent --name pack_per_ip --set") }
    its('content') { should match("-A ufw-http -m recent --name pack_per_ip --update --seconds 1 --hitcount 20 -j ufw-http-logdrop") }

    # Limit connections per IP
    its('content') { should match("-A ufw-http -m state --state NEW -m recent --name conn_per_ip --set") }
    its('content') { should match("-A ufw-http -m state --state NEW -m recent --name conn_per_ip --update --seconds 10 --hitcount 20 -j ufw-http-logdrop") }

    # Ping
    its('content') { should match("-A INPUT -p icmp -m limit --limit 6/s --limit-burst 1 -j ACCEPT") }
    its('content') { should match("-A INPUT -p icmp -j DROP") }

  end
end

control 'hardening-06' do
  title 'Firewall check'
  desc 'Check for firewall rules'
  describe file('/etc/default/ufw') do
    it { should exist }
    it { should be_file }
    its('content') { should match("IPV6=no") }

  end
end














