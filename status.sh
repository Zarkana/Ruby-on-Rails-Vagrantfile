#!/usr/bin/env bash
RED='\e[31m'
BLUE='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[39m' # No Color

echo -e "${YELLOW}RUBY VERSION${NC}"
ruby -v
echo -e "${YELLOW}RAILS VERSION${NC}"
rails -v
echo -e "${YELLOW}RUBY LOCATION${NC}"
which ruby
echo -e "${YELLOW}INSTALLED RUBIES${NC}"
rvm list rubies
echo -e "${YELLOW}DEFAULT RUBY${NC}"
rvm list rubies
echo -e "${YELLOW}KNOWN INSTALLABLE RUBIES${NC}"
rvm list known
