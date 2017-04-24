#!/bin/sh

tee Vagrantfile  << EOF
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
end
EOF


tee .gitignore << EOF
### Vagrant ###
.vagrant/
EOF
