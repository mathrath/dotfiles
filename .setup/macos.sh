#!/bin/bash

source $(dirname "$0")/common.sh

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save screenshots to ~/Pictures/Screenshots
mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# Finder stuff
# Don't show anything on the desktop
defaults write com.apple.finder CreateDesktop false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

killall Finder

# Don't auto rearrange spaces
defaults write com.apple.dock mru-spaces -bool false
killall Dock


# Install some stuff I like

# Install homebrew if it isn't installed
installMaybe brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'

# Install yq so we can use the installPackages script
installMaybe yq "brew install yq"

# Install all my favorite things
PLATFORM=mac ~/.setup/installPackages.sh
