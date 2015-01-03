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

brew cask install postgres

brew install chruby
brew install ruby-build

# cleanup
git reset --hard HEAD
cd ~

# Ruby
mkdir ~/.rubies

ruby-build 2.0 .rubies/2.0.0

# ruby 2.1.4, note the CC env variable, which is needed for the newer rubies to compile
CC=clang ruby-build 2.1.5 .rubies/2.1.5

ruby-build 2.2.0 .rubies/2.2.0
