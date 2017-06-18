#!/bin/sh

mkdir -p inventories
mkdir -p inventories/production/group_vars/all
mkdir -p inventories/local/group_vars/all
mkdir -p inventories/vagrant/group_vars/all
mkdir -p roles

touch inventories/production/hosts


tee inventories/local/hosts << EOF
[webservers]
localhost
EOF


tee inventories/local/group_vars/all/main.yml << EOF
ansible_connection: local
EOF


tee inventories/vagrant/hosts << EOF
[webservers]
localhost
EOF


tee inventories/vagrant/group_vars/all/main.yml << EOF
ansible_user: vagrant
ansible_ssh_pass: vagrant
EOF


tee site.yml << EOF
---
  - include: webservers.yml
EOF


tee webservers.yml << EOF
---
  - hosts: webservers
    roles:
      - common
EOF


tee .gitignore << EOF
### Ansible ###
# Ansible retry files
*.retry
EOF

generate_ansible_role.sh common

