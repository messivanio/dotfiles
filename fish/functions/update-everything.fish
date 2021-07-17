function update-everything
  sudo apt-get update -y
  sudo apt-get upgrade -y --fix-broken
  sudo apt-get dist-upgrade -y
  sudo apt autoremove -y
  asdf update
  asdf plugin update --all
end

sudo apt install -y libssl-dev bzip2 libreadline-dev sqlite


!!!!!!!!!!!!!!!!!!!!