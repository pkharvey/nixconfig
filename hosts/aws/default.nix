{config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      ./hardware.nix
      (modulesPath + "/programs/noisetorch.nix")
      (modulesPath + "/programs/autojump.nix")
      (modulesPath + "/programs/gamemode.nix")
      (modulesPath + "/programs/gamescope.nix")
     ];

  programs.hyprland.enable = true;


       # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
     };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
 
 # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
 
  sound.enable = true;
  programs.noisetorch.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  }; 
  networking.hostName = "aws"; # Define your hostname.

   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  #networking.networkmanager.enable = true;
  services.connman={enable=true; wifi.backend="wpa_supplicant";};
  hardware.bluetooth.enable = true;
  
  

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };



  services.xserver = {
       enable = true;
      # desktopManager.gnome.enable = true;
        displayManager.gdm = {
               enable = true;
               wayland = true;
               };
	}; 





  hardware.opengl = {
	# Mesa
	enable = true;

	# Vulkan
	driSupport = true;
  };



  boot = {
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
    kernelModules = [ "v4l2loopback" ];
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
 
 
  services.printing.enable = true;

  programs.zsh.enable = true; 
  users.users.aws = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = ["wheel" ];
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    linuxPackages.v4l2loopback
  ];
 
  system.stateVersion = "23.05"; 

}
