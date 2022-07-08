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
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "gusztavvargadr/visual-studio-2019-community-windows-10"
  config.vm.box_version = "2019.2102.2205"
  config.vm.boot_timeout = 900
  config.vm.communicator = "winrm"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", privileged: "true", inline: <<-'POWERSHELL'
    Set-TimeZone "Coordinated Universal Time"

    # Install boxstarter
    . { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

    $env:PSModulePath = "$([System.Environment]::GetEnvironmentVariable('PSModulePath', 'User'));$([System.Environment]::GetEnvironmentVariable('PSModulePath', 'Machine'))"
    # Copy setup.ps1 to the Temp directory and then run boxstarter with our setup.ps1 script
    cp C:\vagrant\scripts\setup.ps1 $env:TEMP
    Import-Module Boxstarter.Chocolatey
    $credential = New-Object System.Management.Automation.PSCredential("vagrant", (ConvertTo-SecureString "vagrant" -AsPlainText -Force))
    Install-BoxstarterPackage -PackageName $env:TEMP\setup.ps1 -Credential $credential
  POWERSHELL
end
