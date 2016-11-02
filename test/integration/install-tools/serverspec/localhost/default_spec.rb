# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'
require 'common_shared_examples'
require 'debian_shared_examples'

is_debian_distro = ['debian', 'ubuntu'].include? os[:family]

describe "in Debian distributions", :if => is_debian_distro do

  include_examples "check required deb packages"

  describe package('docker-engine') do
    it { should be_installed }
  end

  describe command("[ $(apt-cache policy docker-engine | grep 'Installed' | \
                    awk '{print $NF}') = $(apt-cache policy docker-engine | \
                    grep 'Candidate' | awk '{print $NF}') ]") do
    its(:exit_status) { should eq 0 }
  end

  include_examples "check installation"

  include_examples "check service"

  include_examples "check installed tools"

end
