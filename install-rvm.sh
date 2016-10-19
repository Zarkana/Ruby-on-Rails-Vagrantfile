#!/usr/bin/env bash

# IMPORTANT: Source RVM as a function into local environment.
#            Otherwise switching gemsets won't work.
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

RED='\e[31m'
BLUE='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[39m' # No Color

echo -e "${BLUE}ATTEMPTING RVM PROVISION${NC}"

echo -e "${YELLOW}COMMAND 1:  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3${NC}"
  # TODO: Add note
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
echo -e "${YELLOW}COMMAND 2: curl -sSL https://get.rvm.io | bash -s $1 --rails${NC}"
  if [[ -s "/home/vagrant/.rvm/scripts/rvm" ]] ; then
    echo 'RVM installed, skipping RVM install'
  else
    # Install RVM on your system, if args in vargrantfile is "stable" then it will be the latest stable version of RVM
    curl -sSL https://get.rvm.io | bash -s $1 --rails
  fi

echo -e "${YELLOW}COMMAND 3: source $HOME/.rvm/scripts/rvm${NC}"
  # TODO: Add note
  source $HOME/.rvm/scripts/rvm

echo -e "${GREEN}COMPLETED RVM PROVISION${NC}"
