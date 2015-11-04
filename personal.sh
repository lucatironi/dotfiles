#!/usr/bin/env bash

# Install work related command-line tools/apps using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `personal.sh` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install chruby
brew install ruby-install

# cleanup
git reset --hard HEAD
cd ~

# Ruby
mkdir ~/.rubies

ruby-install ruby 2.2.3
