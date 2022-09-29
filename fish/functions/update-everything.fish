function update-everything
  if type -qs apt-get
    sudo apt-get update -y
    sudo apt-get upgrade -y --fix-broken
    sudo apt-get dist-upgrade -y
  end

  if type -qs apt
    sudo apt autoremove -y
  end

  if type -qs asdf
    asdf update
    asdf plugin update --all
  end

  if type -qs brew
    sudo chown -R (whoami) /home/linuxbrew/
    brew upgrade
  end
  
  if type -qs topgrade
    topgrade
  end
end
