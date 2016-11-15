# -*- mode: ruby -*-
# vi: set ft=ruby :

$PROVISION_SCRIPT = <<SCRIPT
  echo 'StrictHostKeyChecking no' > ~/.ssh/config
  echo 'UserKnownHostsFile=/dev/null no' >> ~/.ssh/config
  apt-add-repository -y ppa:ansible/ansible
  apt-get update -q && apt-get install -y software-properties-common git ansible
SCRIPT

Vagrant.require_version '>= 1.8.3'

Vagrant.configure(2) do |config|
  ram = 1024
  cpu = 2
  dev_ip = '192.168.33.91'

  config.vm.provider 'virtualbox' do |v|
    v.memory = ram
    v.cpus = cpu
  end

  # Development VM
  config.vm.define 'dev', primary: true do |dev|
    dev.vm.box = 'boxcutter/ubuntu1604-desktop'
    dev.vm.hostname = 'dotfiles-dev'
    dev.vm.network 'private_network', ip: dev_ip
    dev.ssh.forward_agent = true
    dev.vm.post_up_message = "Ready to development. Use \'vagrant ssh\'. \
    \nVirtual machine ip address: #{dev_ip}"

    dev.vm.provision :shell, keep_color: true, inline: $PROVISION_SCRIPT
  end

  # Use vagrant-cachier to cache apt-get, gems and other stuff across machines
  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')
end

