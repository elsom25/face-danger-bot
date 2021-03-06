# -*- mode: ruby -*-
# vi: set ft=ruby :

APP_PATH = "/face-danger-bot"

Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
  config.vm.box = "bento/debian-8.2"
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  config.vm.network "private_network", ip: "192.168.135.10"

  if Vagrant::Util::Platform.windows? || ENV["NFS"] == "false"
    config.vm.synced_folder ".", APP_PATH, enabled: true
  else
    config.vm.synced_folder ".", APP_PATH, enabled: true, type: :nfs
  end

  if Vagrant.has_plugin? "vagrant-cachier"
    config.cache.scope = :box

    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ["rw", "vers=3", "tcp", "nolock"]
    } unless Vagrant::Util::Platform.windows?
  end

  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.provider "parallels" do |pl|
    pl.update_guest_tools = true
    pl.use_linked_clone = true
    pl.cpus = 2
    pl.memory = 2048
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbooks/site.yml"
    ansible.extra_vars = {
      app_path: APP_PATH
    }
  end
end
