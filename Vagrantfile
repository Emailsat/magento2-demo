# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :magento2 do |magento2_config|
        magento2_config.vm.box = "Debian81"
        magento2_config.vm.box_url = "https://ctors.net/vagrant/Debian81.box"

        magento2_config.vm.provider "virtualbox" do |v|
            # show a display for easy debugging
            v.gui = false

            # RAM size
            v.memory = 2048

            # Allow symlinks on the shared folder
            v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        end

        # allow external connections to the machine
        #magento2_config.vm.forward_port 80, 8080

        # Shared folder over NFS
        magento2_config.vm.synced_folder ".", "/vagrant", type: "nfs"

        magento2_config.vm.network "private_network", ip: "192.168.33.10"

        # Shell provisioning
        magento2_config.vm.provision :shell, :path => "shell_provisioner/run.sh"
    end
end
