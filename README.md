# Ansible Playbooks
Inventory, tool and configuration management

## Getting Started

### Setup ansible

#### Install

[Link](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-apt-ubuntu) to installation

#### Configuration

For local usage, edit ```/etc/ansible/hosts``` to contain

```
[local]
127.0.0.1
```

### Setup SSH

#### Install

```
sudo apt-get update
sudo apt-get install openssh-server
```

#### Start

```
start ssh
```

## Usage

### All

```
ansible-playbook <path_to_playbook_yml>
```

### With tags

```
ansible-playbook <path_to_playbook_yml> -t [tags]
```
