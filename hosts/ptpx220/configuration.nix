# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/wireless.nix
      "${inputs.self}/mixins/bash.nix"
      "${inputs.self}/mixins/kitty.nix"
      "${inputs.self}/mixins/locale.nix"
      "${inputs.self}/mixins/sway"
      "${inputs.self}/mixins/gammastep.nix"
      "${inputs.self}/mixins/progs-work.nix"
      "${inputs.self}/mixins/progs-radio.nix"
      "${inputs.self}/mixins/editor/nvim.nix"
      "${inputs.self}/mixins/audio.nix"
      "${inputs.self}/mixins/users/pasha.nix"
      "${inputs.self}/mixins/users/disableMutableUsers.nix"
      "${inputs.self}/mixins/printing.nix"
      "${inputs.self}/mixins/avahi.nix"
      "${inputs.self}/mixins/common.nix"
      "${inputs.self}/mixins/tailscale.nix"
      "${inputs.self}/mixins/openssh.nix"
      "${inputs.self}/mixins/ssh/sk_keys.nix"
      "${inputs.self}/mixins/nrfjprog-udev.nix"
      "${inputs.self}/mixins/dslogic-udev.nix"
      "${inputs.self}/mixins/hackrfone-udev.nix"
      # ./modules/ups.nix
    ];

  virtualisation.docker.enable = true;

  boot = {
    # Use latest kernel: https://github.com/NixOS/nixpkgs/issues/30335#issuecomment-336031992
    kernelPackages = pkgs.zfs.latestCompatibleLinuxPackages;
    # Use the systemd-boot EFI boot loader, instead of GRUB.
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "b3961972";

  networking.hostName = "ptpx220";

  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.wireless.userControlled.enable = true;
  networking.wireless.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  hardware.graphics = {
    enable32Bit = true;
    enable = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      PCIE_ASPM_ON_BAT = "powersupersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_MAX_PERF_ON_AC = "100";
      CPU_MAX_PERF_ON_BAT = "30";
      STOP_CHARGE_THRESH_BAT1 = "94";
      STOP_CHARGE_THRESH_BAT0 = "94";
    };
  };

  services.illum.enable = true;

  # Enable xdg.portal for Wayland
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs;
      [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };

  services.xserver.xkb.options = "terminate:ctrl_alt_bksp,ctrl:swapcaps";

  users.users.root.hashedPassword = lib.mkForce "$6$jjdykpb.kwVJ.wY4$sKFyUPK6HpWH3twrCodgWOu5EIPlzS/Zqa4kPWTOnpuzICRDAFXUrBisvWOEX464THhykP0xFxr674R8KjDzT1";
  users.users.pasha.hashedPassword = lib.mkForce "$6$0GAwzY9tiFg9$.XVNuKseZryk3LGtbtJ7cUJ5cL.A5w4.UFeZ5lKuRaycUbZjoOwR.M34EZcGu6Bn.3wgUjrui.j.pTBFYp3Ph0";

  environment.systemPackages = with pkgs; [
    wpa_supplicant_gui
    wget
    inputs.firefox.packages.${pkgs.hostPlatform.system}.firefox-nightly-bin
    foot
    element-desktop
    picocom
    tmux
    screen
  ];

  # For mounting Android MTP devices
  services.gvfs.enable = true;

  hardware.rtl-sdr.enable = true;

  system.stateVersion = "23.11";
}

