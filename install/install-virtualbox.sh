wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) non-free contrib" >> /etc/apt/sources.list.d/virtualbox.org.list'
sudo apt install -y virtualbox
