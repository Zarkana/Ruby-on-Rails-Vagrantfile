#!/usr/bin/env bash

 # IMPORTANT: Source RVM as a function into local environment.
 #            Otherwise switching gemsets won't work.
 [ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

RED='\e[31m'
BLUE='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[39m' # No Color

echo -e "${BLUE}ATTEMPTING INSTALL-POST PROVISION${NC}"

echo -e "${YELLOW}COMMAND 1: sudo apt-get install -y nodejs${NC}"
  # TODO: Add note
  sudo apt-get install -y nodejs
echo -e "${YELLOW}COMMAND 2: cd /vagrant${NC}"
  #Change to the vagrant directory
  cd /vagrant
echo -e "${YELLOW}COMMAND 3: gem install rails${NC}"
  # TODO: Add note
  gem install rails
echo -e "${YELLOW}COMMAND 4: ruby -v${NC}"
  # TODO: Add note
  ruby -v
echo -e "${YELLOW}COMMAND 5: rails -v${NC}"
  # TODO: Add note
  rails -v
echo -e "${YELLOW}COMMAND 6: rails new $1${NC}"
  # TODO: Add note
  rails new $1
echo -e "${YELLOW}COMMAND 7: UPDATE pg_database SET datistemplate=false WHERE datname='template1';${NC}"
  # TODO: Add note
  sudo -u postgres psql -d sample_db -c "UPDATE pg_database SET datistemplate=false WHERE datname='template1';"
echo -e "${YELLOW}COMMAND 8: sudo -u postgres psql -d sample_db -c 'drop database Template1'${NC}"
  # TODO: Add note
  sudo -u postgres psql -d sample_db -c "drop database Template1";
echo -e "${YELLOW}COMMAND 9: sudo -u postgres psql -d sample_db -c 'create database template1 with owner=postgres encoding="UTF-8" lc_collate="en_US.utf8" lc_ctype="en_US.utf8" template template0;';${NC}"
  # TODO: Add note
  sudo -u postgres psql -d sample_db -c "create database template1 with owner=postgres encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;";
echo -e "${YELLOW}COMMAND 10: sudo -u postgres psql -d sample_db -c 'update pg_database set datistemplate=true where datname="template1";';${NC}"
  # TODO: Add note
  sudo -u postgres psql -d sample_db -c "update pg_database set datistemplate=true where datname='template1';";
echo -e "${YELLOW}COMMAND 11: createdb -T template1 dbname;${NC}"
  # TODO: Add note
  createdb -T template1 dbname;
#echo -e "${YELLOW}COMMAND 12: rake db:create db:migrate db:seed${NC}"
  # TODO: Add note
  #rake db:create db:migrate db:seed

echo -e "${GREEN}COMPLETED INSTALL-POST PROVISION${NC}"
