function update-everything
  sudo apt-get update -y
  sudo apt-get upgrade -y --fix-broken
  sudo apt-get dist-upgrade -y
  sudo apt autoremove -y
  asdf update
  asdf plugin update --all
end
