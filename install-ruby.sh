#!/usr/bin/env bash

# IMPORTANT: Source RVM as a function into local environment.
#            Otherwise switching gemsets won't work.
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

RED='\e[31m'
BLUE='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[39m' # No Color

echo -e "${BLUE}ATTEMPTING RUBY $1 PROVISION${NC}"

echo -e "${YELLOW}COMMAND 2: rvm mount https://rubies.travis-ci.org/ubuntu/12.04/x86_64/ruby-2.3.1.tar.bz2${NC}"
 if rvm list strings | grep -lq ruby-$1 ; then
   echo 'Ruby 2.3.1 installed. Skipping installed.'
 else
   rvm autolibs packages
   rvm requirements
   rvm mount https://rubies.travis-ci.org/ubuntu/12.04/x86_64/ruby-2.3.1.tar.bz2
   rvm use $1 --default
   gem update bundler
 fi

echo -e "${GREEN}COMPLETED RUBY PROVISION${NC}"
