# -*- mode: ruby -*-
# vi: set ft=ruby :

shared_examples "check installation" do

    describe group('docker') do
      it { should exist }
    end

end

shared_examples "check service" do

    describe file('/var/run/docker.sock') do
      it { should be_socket }
      it { should be_owned_by 'root' }
      it { should be_grouped_into 'docker' }
    end

    describe service('docker') do
      it { should be_enabled }
      it { should be_running }
    end

    ['dockerd', 'docker-containerd'].each do |docker_proc|
      describe process(docker_proc) do
        it { should be_running }
        its(:count) { should eq 1 }
        its(:user) { should eq 'root' }
      end
    end

end

shared_examples "check installed tools" do
    # Make sure pip is installed
    describe command('command -v pip') do
       its(:exit_status) { should eq 0 }
    end

    # Check for docker-compose tool version
    describe command("pip -q freeze | grep docker-compose | awk -F'==' '{print $NF}'") do
       its(:stdout) { should match /1.6.2/ }
    end

    # Check for docker-py lib version
    describe command("pip -q freeze | grep docker-py | awk -F'==' '{print $NF}'") do
       its(:stdout) { should match /1.10.5/ }
    end
end
