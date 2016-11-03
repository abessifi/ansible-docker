# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'
require 'common_shared_examples'
require 'debian_shared_examples'
require 'redhat_shared_examples'

is_debian_distro = ['debian', 'ubuntu'].include? os[:family]
is_redhat_distro = ['redhat'].include? os[:family]

describe "Chech Debian specifications", :if => is_debian_distro do

  include_examples "check required deb packages"

  describe package('docker-engine') do
    it { should be_installed }
  end

  describe command("[ $(apt-cache policy docker-engine | grep 'Installed' | \
                    awk '{print $NF}') = $(apt-cache policy docker-engine | \
                    grep 'Candidate' | awk '{print $NF}') ]") do
    its(:exit_status) { should eq 0 }
  end

end

describe "Chech RedHat specifications", :if => is_redhat_distro do

  include_examples "check required rpm packages"

  describe package('docker-engine') do
    it { should be_installed }
  end

  describe command("[ $(yum list installed docker-engine | tail -1 | \
                    awk '{print $2}') = $(yum list available docker-engine --showduplicates | \
                    tail -1 | awk '{print $2}') ]") do
    its(:exit_status) { should eq 0 }
  end

end

describe "Check setup" do
  include_examples "check installation"
  include_examples "check service"
end
