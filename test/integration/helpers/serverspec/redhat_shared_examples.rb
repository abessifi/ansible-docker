# -*- mode: ruby -*-
# vi: set ft=ruby :

shared_examples "check required rpm packages" do

  ['curl'].each do |package_depends|
    describe package(package_depends) do
      it { should be_installed }
    end
  end

  describe file('/etc/yum.repos.d/docker.repo') do
    it { should be_file }
  end

end
