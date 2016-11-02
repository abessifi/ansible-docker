# -*- mode: ruby -*-
# vi: set ft=ruby :

shared_examples "check required deb packages" do

  ['curl', 'apt-transport-https', 'ca-certificates'].each do |package_depends|
    describe package(package_depends) do
      it { should be_installed }
    end
  end

  ['lxc-docker', 'docker.io'].each do |legacy_package|
    describe package(legacy_package) do
      it { should_not be_installed }
    end
  end

  describe file('/etc/apt/sources.list.d/docker.list') do
    it { should be_file }
  end

end
