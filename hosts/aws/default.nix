{config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      ./virtualization.nix
      ./hardware.nix
     ];


  environment.binsh = "${pkgs.dash}/bin/dash";

       # Allow unfree packages
  nixpkgs = {
  overlays = [(final: prev: { stable = import inputs.nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; };}) ];
  config.allowUnfree = true;
  config.allowBroken = true;
  };
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
  hardware.bluetooth.enable = true;
  


  services.connman={enable=true; wifi.backend="wpa_supplicant";};
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.sudo.enable = true;
    security.sudo.configFile = '' %wheel ALL=(ALL) ALL '';
  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ "6ab565387a095d4c" ];
  programs.noisetorch.enable =true;
  programs.autojump.enable =true;
  programs.gamemode.enable =true;
  programs.gamescope.enable =true;

  services.xserver = {
       enable = true;
      # desktopManager.gnome.enable = true;
        displayManager.sddm = {
               theme = "${import ../../profiles/aws/nixconfigs/theme/sddm-theme.nix {inherit pkgs;}}"; 
               enable = true;
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
 
  nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  services.printing.enable = true;
  programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.steam = {
  package = pkgs.stable.steam;
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.zsh.enable = true; 
  users.users.aws = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = [ "wheel" "libvirtd" ];
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    linuxPackages.v4l2loopback
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
 
  system.stateVersion = "23.05"; 

}
