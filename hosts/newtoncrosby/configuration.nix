# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/sway.nix
      ./modules/wireless.nix
      ./modules/audio.nix
    ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_5_14;
  #boot.kernelPackages = pkgs.linuxPackages_5_4;
  boot.kernelPackages = pkgs.zfsUnstable.latestCompatibleLinuxPackages;

  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "d25df661";

  networking.hostName = "newtoncrosby"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
  #networking.networkmanager.enable = true;
  networking.wireless.userControlled.enable = true;
  networking.wireless.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  hardware.opengl = {
    driSupport32Bit = true;
    enable = true;
  };

  services.illum.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Enable xdg.portal for Wayland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.xkbOptions = "terminate:ctrl_alt_bksp,ctrl:swapcaps";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.hashedPassword = "$6$jjdykpb.kwVJ.wY4$sKFyUPK6HpWH3twrCodgWOu5EIPlzS/Zqa4kPWTOnpuzICRDAFXUrBisvWOEX464THhykP0xFxr674R8KjDzT1";
  users.users.pasha = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$0GAwzY9tiFg9$.XVNuKseZryk3LGtbtJ7cUJ5cL.A5w4.UFeZ5lKuRaycUbZjoOwR.M34EZcGu6Bn.3wgUjrui.j.pTBFYp3Ph0";
  };

  users.mutableUsers = false;

  # List of users for additional Nix demon rights to connect.
  nix.trustedUsers = [ "root" "pasha" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    foot
    git
    gnumake42
    element-desktop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # For mounting Android MTP devices
  services.gvfs.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

