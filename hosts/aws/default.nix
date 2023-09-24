{config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      ./virtualization.nix
      ./hardware.nix
      (modulesPath + "/programs/noisetorch.nix")
      (modulesPath + "/programs/autojump.nix")
      (modulesPath + "/programs/gamemode.nix")
      (modulesPath + "/programs/gamescope.nix")
     ];


  environment.binsh = "${pkgs.dash}/bin/dash";

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


  programs.zsh.enable = true; 
  users.users.aws = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = ["wheel libvirtd" ];
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
