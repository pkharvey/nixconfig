{config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (modulesPath + "/programs/noisetorch.nix")
      (modulesPath + "/programs/autojump.nix")
      (modulesPath + "/programs/gamemode.nix")
      (modulesPath + "/programs/gamescope.nix")
      "${inputs.self}/mixins/pipewire.nix"
      "${inputs.self}/mixins/locale.nix"
      "${inputs.self}/mixins/common.nix"
      "${inputs.self}/mixins/thunar.nix"
     ];

 

  
  networking.hostName = "aws"; # Define your hostname.

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
#   nixpkgs.overlays = [
#    (self: super: {
#      waybar = super.waybar.overrideAttrs (oldAttrs: {
#        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
#     });
#    })
#  ];


  # Enable Environment.
  services.xserver = {
       enable = true;
      # desktopManager.gnome.enable = true;
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
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
 
 
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
  gnome.file-roller
  cinnamon.nemo-with-extensions
  cinnamon.nemo-fileroller
  discord-canary
  way-displays
  ventoy-full
  xdg-desktop-portal-hyprland
  vulkan-tools
  polkit_gnome
  gparted
  python311
  python311Packages.pipx
  lzip
  neovim
  git
  oh-my-fish
  waybar
  #hypr assets : 
  mako
  (wrapOBS {
      plugins = with obs-studio-plugins; [
        obs-backgroundremoval
	obs-vaapi
        wlrobs
	obs-gstreamer
        obs-vkcapture
      ];
    })
  v4l-utils
  linuxPackages.v4l2loopback
  bemenu
  gh
  connman-gtk
  linux-wifi-hotspot
  blueberry
  wpa_supplicant
  swww
  libsForQt5.qt5.qtwayland
  qt6.qtwayland
  flatpak
  flatpak-builder
  gnome.gnome-software
  cliphist
  fzf
  playerctl
  wine
  wine64
  winetricks
  slurp
  grim
  wtype
  wl-clipboard
  firefox
  lxappearance
  wlr-randr
  ];
 
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
