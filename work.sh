#!/usr/bin/env bash

# Install work related command-line tools/apps using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `work.sh` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew cask install sequel-pro

brew install memcached
brew install jansson
brew install hiredis
brew install mysql
brew install chruby
brew install ruby-build
brew install ruby-install

# Install imagemagick
cd /usr/local

# we'll use imagemagick from this homebrew revision
git checkout 7d951fb /usr/local/Library/Formula/imagemagick.rb

brew install imagemagick

# make sure it doesn't get upgraded when doing `brew upgrade`
brew pin imagemagick

# cleanup
git reset --hard HEAD
cd ~

# Ruby
mkdir ~/.rubies

# needed for older rubies
brew tap homebrew/dupes
brew install apple-gcc42

# ruby 1.8.7 for legacy app
ruby-build 1.8.7-p375 .rubies/1.8.7-p375

# new rubies
ruby-install ruby 2.1.7
ruby-install ruby 2.2.3
