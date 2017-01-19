# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # NOTE: Add or comment out provisions below you want to run or not run in the order you want them to run
  # Runs initial provision commands
  config.vm.provision :shell, path: "install-pre.sh", args: "", privileged: false
  # Installs rvm, args => rvm version
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable", privileged: false
  # Installs ruby, args => ruby version
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.3.1", privileged: false
  # Runs final provision commands, args => name of project directory to create
  config.vm.provision :shell, path: "install-post.sh", args: "my_project", privileged: false
  # Echos ruby and rails versions
  config.vm.provision :shell, path: "versions.sh", args: "", privileged: false

end

#Instructions to set up rails environment:
# 1. Install vagrant, virtualmachine, and git bash
# 2. In git bash, migrate to the directory of this vagrant file and run "vagrant up" to being provision
# 3. The provision should complete in around 9 minutes, enter your new vagrant environment by running "vagrant ssh"
# 4. Navigate to the rails project which is ususally located in "../../vagrant/<project name>(default is my_project)"
# 5. Run rails server with "rails server -b0.0.0.0"
# 6. Access your server with http://localhost:3000


#Instructions to debug
# Problem 1. "Vagrant cannot forward the specified ports on this VM, since they would collide with some other application that is already listening on these ports."
# Fix 1: Run "vagrant global-status" if any virtualbox providers are running, go to the directory and destroy or halt the environment
# Fix 2: Open Oracle VM Virtualbox and remove/halt any conflicting and running virtual boxes
# Problem 2. Cannot render console from 10.0.2.2! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
# Fix 1: Kill the process of services running on the port you set vagrant to run on, likely 3000
# "fuser 3000/tcp will print you the PID of the process bound on that port. fuser -k 3000/tcp will kill that process"
# Fix 2: Add the following to config/application.rb
# config.web_console.whitelisted_ips = '10.0.2.2'
# # or a whole network
# config.web_console.whitelisted_ips = '10.0.2.2/16'
# Fix 3: Add the folloring to config/environments/development.rb
# config.web_console.whiny_requests = false
