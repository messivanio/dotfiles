TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
