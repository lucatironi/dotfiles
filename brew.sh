#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `brew.sh` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Zsh & oh-my-shell
brew install Zsh
curl -L http://install.ohmyz.sh | sh

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

brew install git
brew install redis

# Install brew cask
brew install caskroom/cask/brew-cask

# Install cask applications
brew cask install google-chrome
brew cask install firefox
brew cask install sublime-text
brew cask install github
brew cask install iterm2
brew cask install skype
brew cask install slack
brew cask install flux

# Remove outdated versions from the cellar.
brew cleanup
