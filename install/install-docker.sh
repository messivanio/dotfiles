sudo apt-get remove -y docker docker-engine docker.io
sudo apt-get update -y
sudo apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo apt-get install -y docker-compose
sudo usermod -aG docker $USER
sudo docker run hello-world
echo "Now, logout and login, please"