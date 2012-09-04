Vagrant::Config.run do |config|
  config.vm.box = "oneiric-server-32"

  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "./puppet/modules"
    puppet.manifests_path = "./puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end

  config.vm.define :host1 do |config|
    config.vm.network :hostonly, "33.33.33.11";
    config.vm.host_name = "host1.example.org";
  end
  config.vm.define :host2 do |config|
    config.vm.network :hostonly, "33.33.33.12";
    config.vm.host_name = "host2.example.org";
  end
  config.vm.define :host3 do |config|
    config.vm.network :hostonly, "33.33.33.13";
    config.vm.host_name = "host3.example.org";
  end
  config.vm.define :host4 do |config|
    config.vm.network :hostonly, "33.33.33.14";
    config.vm.host_name = "host4.example.org";
  end
end
