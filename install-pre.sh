 #!/usr/bin/env bash

 # IMPORTANT: Source RVM as a function into local environment.
 #            Otherwise switching gemsets won't work.
 [ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"

RED='\e[31m'
BLUE='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[39m' # No Color

echo -e "${BLUE}ATTEMPTING INSTALL-INITIAL PROVISION${NC}"

echo -e "${YELLOW}COMMAND 1: sudo apt-get update -y${NC}"
# TODO: Add note
sudo apt-get update -y

echo -e "${YELLOW}COMMAND 2: sudo apt-get install -y git${NC}"
# TODO: Add note
sudo apt-get install -y git

echo -e "${YELLOW}COMMAND 3: sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8${NC}"
# TODO: Add note
sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo -e "${YELLOW}COMMAND 4: sudo apt-get install postgresql libpq-dev${NC}"
# TODO: Add note
sudo apt-get install -y postgresql libpq-dev

echo -e "${YELLOW}COMMAND 5: sudo mkdir -p /usr/local/pgsql/data${NC}"
# TODO: Add note
sudo mkdir -p /usr/local/pgsql/data

echo -e "${YELLOW}COMMAND 6: sudo chown postgres:postgres /usr/local/pgsql/data${NC}"
# TODO: Add note
sudo chown postgres:postgres /usr/local/pgsql/data

echo -e "${YELLOW}COMMAND 8: sudo -u postgres createuser -s vagrant${NC}"
# TODO: Add note
sudo -u postgres createuser -s vagrant

echo -e "${YELLOW}COMMAND 10: sudo -u postgres createdb sample_db${NC}"
# su postgres -c 'createdb sample_db'
# TODO: Add note
sudo -u postgres createdb sample_db

echo -e "${YELLOW}COMMAND 11: ALTER ROLE vagrant CREATEDB;${NC}"
# su postgres -c 'psql -d sample_db -c "ALTER ROLE vagrant CREATEDB;"'
# TODO: Add note
sudo -u postgres psql -d sample_db -c "ALTER ROLE vagrant CREATEDB;"

echo -e "${YELLOW}COMMAND 12: sudo gem install bundler${NC}"
  # TODO: Add note
  sudo gem install bundler

echo -e "${GREEN}COMPLETED INSTALL-INITIAL PROVISION${NC}"
