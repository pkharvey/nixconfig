{config, inputs, lib, pkgs, modulesPath, ... }:
{
virtualisation.libvirtd.enable = true;
virtualisation.spiceUSBRedirection.enable = true;
programs.dconf.enable = true;
environment.systemPackages = with pkgs; [ virt-manager ];
}

