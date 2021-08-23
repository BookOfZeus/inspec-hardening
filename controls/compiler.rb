
#
control "compiler-01" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/byacc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-02" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/yacc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-03" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/bcc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-04" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/kgcc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-05" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/cc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-06" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/gcc') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-07" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/c++') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

#
control "compiler-08" do
  title "Check for compilers"
  desc "Make sure the compilers are not use by anyone"
  describe file('/usr/bin/g++') do
    it { should_not be_executable }
    it { should_not be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
    it { should_not be_readable.by('owner') }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
  end
end

