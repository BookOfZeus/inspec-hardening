#
control 'sysctl-01' do
  title 'IPv4 Forwarding'
  desc "If you're not intending for your system to forward traffic between interfaces, or if you only have a single interface, the forwarding function must be disable."

  describe kernel_parameter('net.ipv4.ip_forward') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.all.forwarding') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.all.rp_filter') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.default.rp_filter') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.icmp_echo_ignore_broadcasts') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.all.accept_source_route') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.all.accept_source_route') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.default.accept_source_route') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.accept_source_route') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.all.send_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.default.send_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.tcp_syncookies') do
    its(:value) { should eq 2048 }
  end

  describe kernel_parameter('net.ipv4.tcp_max_syn_backlog') do
    its(:value) { should eq 2048 }
  end

  describe kernel_parameter('net.ipv4.tcp_synack_retries') do
    its(:value) { should eq 2 }
  end

  describe kernel_parameter('net.ipv4.tcp_syn_retries') do
    its(:value) { should eq 5 }
  end

  describe kernel_parameter('net.ipv4.conf.all.log_martians') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.icmp_ignore_bogus_error_responses') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.all.accept_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.all.accept_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.default.accept_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.accept_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.icmp_echo_ignore_all') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.all.secure_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.default.secure_redirects') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('kernel.exec-shield') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('kernel.randomize_va_space') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv6.conf.default.router_solicitations') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.accept_ra_rtr_pref') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.accept_ra_pinfo') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.accept_ra_defrtr') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.autoconf') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.dad_transmits') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.default.max_addresses') do
    its(:value) { should eq 1 }
  end


  describe kernel_parameter('net.ipv4.icmp_ratelimit') do
    its(:value) { should eq 100 }
  end

  describe kernel_parameter('net.ipv4.icmp_ratemask') do
    its(:value) { should eq 88089 }
  end

  describe kernel_parameter('net.ipv4.tcp_timestamps') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv4.conf.all.arp_ignore') do
    its(:value) { should cmp(/(1|2)/) }
  end

  describe kernel_parameter('net.ipv4.conf.all.arp_announce') do
    its(:value) { should eq 2 }
  end

  describe kernel_parameter('net.ipv4.tcp_rfc1337') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.all.shared_media') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv4.conf.default.shared_media') do
    its(:value) { should eq 1 }
  end

  describe kernel_parameter('net.ipv6.conf.all.forwarding') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('net.ipv6.conf.all.accept_ra') do
    its(:value) { should eq 0 }
  end
  describe kernel_parameter('net.ipv6.conf.default.accept_ra') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('kernel.sysrq') do
    its(:value) { should eq 0 }
  end

  describe kernel_parameter('fs.suid_dumpable') do
    its(:value) { should cmp(/(0|2)/) }
  end

end

