GOLANG_VERSION=1.13.4

cd /tmp
wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go/
sudo tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz

mkdir -p ~/code/go/src
mkdir -p ~/code/go/pkg
mkdir -p ~/code/go/bin
