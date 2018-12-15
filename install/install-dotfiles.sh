sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update -y
sudo apt-get install -y git

sudo locale-gen pt_BR pt_BR.UTF-8

cd ~ && rm -rf ~/dotfiles && git clone https://github.com/messivanio/dotfiles.git
grep 'source ~/dotfiles/bash/.bashrc' ~/.bashrc || echo 'source ~/dotfiles/bash/.bashrc' >> ~/.bashrc


