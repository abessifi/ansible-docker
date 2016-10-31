# Ansible Docker

## Description

[![Build Status](https://travis-ci.org/abessifi/ansible-docker.svg?branch=master)](https://travis-ci.org/abessifi/ansible-docker)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-abessifi.docker-blue.svg)](https://galaxy.ansible.com/abessifi/docker/)
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/abessifi/ansible-docker.svg)](http://isitmaintained.com/project/abessifi/ansible-docker "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/abessifi/ansible-docker.svg)](http://isitmaintained.com/project/abessifi/ansible-docker "Percentage of issues still open")

This is an Ansible role to install Docker engine on several GNU/Linux distributions.

## Requirements

### Software Requirements

- **Ansible 2.0** or higher (can be easily installed via `pip`. E.g: `sudo pip install ansible==2.0.0.2`)
- **[Vagrant](https://www.vagrantup.com) 1.7** or higher (for testing purposes)
- **Virtualbox** (for testing purposes with Vagrant)
- **[Oh-my-box](https://github.com/abessifi/oh-my-box)** tool, optional, if you want to quickly provision and package a Vagrant base box with **Ansible** and **Ruby** pre-installed (recommanded to write and run acceptance tests with test-kitchen against the Ansible role).

## Supported Systems

- Debian
- Ubuntu

More infos in the role's metadata file.

## Dependencies

None.

## Role Variables

- **`docker_install_latest`** - Flag to perform the installation of the latest version of Docker engine (default: `true`)
- **`docker_pkg_version`** - If defined, this variable should specify the docker engine package version to be installed according to the Linux distribution system you want to provision (default: not defined). E.g: to install Docker engine `1.12.0` on Debian Jessie, set `docker_pkg_version` to `1.12.1-0~jessie`. In this use case, `docker_install_latest` should be set to `false`.
- **`docker_py_lib_version`** - The version of docker-py library to be installed (default: `1.10.5`)
- **`docker_compose_tool_version`** - The version of docker-compose tool to be installed (default: `1.6.2`)

## Available tags

- **`docker-setup`** - Specify this tag to perform the installation and configuration of Docker engine.
- **`docker-start-service`** - Starts the Docker engine service.
- **`docker-stop-service`** - Stops the Docker engine service.
- **`docker-restart-service`** - Restarts the Docker engine service.
- **`docker-install-dockerpy`** - Specify this tag to install the `docker-py` library.
- **`docker-install-compose`** - Flag this Ansible tag if you want to install `docker-compose` tool.

## Usage

In order to install Docker Engine across you plateform, start by checking out the role from Ansible galaxy:

```bash
ansible-galaxy install abessifi.docker
```

Finally call the role within you Ansible playbook:

```yaml
---
- hosts: all
  roles:
    - ansible-docker
```

## Development and testing

### Test with Vagrant

For quick tests, you can spin up a Debian VM using Vagrant. In the project directory `test/vagrant/` you can customize the Vagrantfile that describes your virtual machine and adapt a set of Ansible inventory files that suit your environment (IP addresses, SSH credentials, etc).

>**Note:** The `ansible-docker` role must be ran with a `sudo` user. In this example,
the `vagrant` user has sudo privileges already configured.

Start by getting the project from Github or Ansible Glaxy, then enter the `test/vagrant/` directory.

Now, run and provision the VM:

```bash
vagrant up
```

Your testing VM is up and running with Docker !

## Author Information

This role was created by [Ahmed Bessifi](https://www.linkedin.com/in/abessifi), a DevOps enthusiast.
