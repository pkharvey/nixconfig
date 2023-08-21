# Edit thi9;9u configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (modulesPath + "/programs/noisetorch.nix")
      (modulesPath + "/programs/autojump.nix")
      (modulesPath + "/programs/gamemode.nix")
      (modulesPath + "/programs/gamescope.nix")
     ];
 

  programs.noisetorch.enable = true;
  
  networking.hostName = "aws"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # 
  #networking.proxy.default = "http://user:password@proxy:port/";
   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.networkmanager.enable = true;
  services.connman={enable=true; wifi.backend="wpa_supplicant";};
  hardware.bluetooth.enable = true;
  
  

  #enable steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
 
  boot.supportedFilesystems = [ "ntfs" ];

 #waybar fix
   nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
 

 # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable Environment.
  services.xserver = {
#       enable = true;
#       desktopManager.gnome.enable = true;
        displayManager.gdm = {
               enable = true;
               wayland = true;
               };
	}; 
  programs.hyprland.enable = true;
  hardware.opengl = {
	# Mesa
	enable = true;

	# Vulkan
	driSupport = true;
  };

 
 
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

   

  # services.xserver.libinput.enable = true;
  programs.fish.enable = true;
 

 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aws = {
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = ["wheel" ];
    packages = with pkgs; [
    ];
   shell=pkgs.fish;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  xorg.xhost
  way-displays
  ventoy-full
  vulkan-tools
  polkit_gnome
  gparted
  python311
  python311Packages.pipx
  lzip
  neovim
  git
  oh-my-fish
  pavucontrol
  #hypr assets : 
  mako
  (wrapOBS {
      plugins = with obs-studio-plugins; [
        obs-backgroundremoval
        wlrobs
        obs-vkcapture
      ];
    })
  v4l-utils
  bemenu
  connman-gtk
  blueberry
  wpa_supplicant
  swww
  waybar
  libsForQt5.qt5.qtwayland
  qt6.qtwayland
  wireplumber
  flatpak
  gnome.gnome-software
  cliphist
  fzf
  playerctl
  wine
  wine64
  winetricks
  unrar
  discord-canary
  slurp
  grim
  qogir-theme
  noisetorch
  wtype
  wl-clipboard
  firefox
  lxappearance
  xfce.thunar
  xarchiver
  wlr-randr
  cadence
  qjackctl
  helvum
  ];
 
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
