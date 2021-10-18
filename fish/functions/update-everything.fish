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
    brew upgrade
  end
end
