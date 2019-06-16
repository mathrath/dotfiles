# Some functions to use in all scripts

# Install something only if the command isn't found
#
# "But Matt, is this function really necessary? Wouldn't the package manager just skip over it if it's not installed?"
# Yeah, true... I'm keeping it around for a few reasons:
#   * It makes the console output cleaner
#   * It's helpful for things that aren't actually in the package manager
#   * It won't reinstall something that I might have installed a different version of (like node in debian)
installMaybe () {
  if ! [ -x "$(command -v $1)" ]; then
    echo "Installing $1"
    eval $2
  else
    echo "$1 is already installed"
  fi
}

# Install zplug if it isn't installed
installZplug () {
  if [ -e ~/.zplug ]; then
    echo "zplug is already installed"
  else
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
}
