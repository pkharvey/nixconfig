{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./zfs-requirements.nix
    "${inputs.self}/mixins/bash.nix"
    "${inputs.self}/mixins/locale.nix"
    "${inputs.self}/mixins/sway"
    "${inputs.self}/mixins/gammastep.nix"
    "${inputs.self}/mixins/progs-work.nix"
    "${inputs.self}/mixins/editor/nvim.nix"
    "${inputs.self}/mixins/audio.nix"
    "${inputs.self}/mixins/intel_vm.nix"
    "${inputs.self}/mixins/libvirtd.nix"
    "${inputs.self}/mixins/users/pasha.nix"
    "${inputs.self}/mixins/users/disableMutableUsers.nix"
    "${inputs.self}/mixins/printing.nix"
    "${inputs.self}/mixins/common.nix"
    "${inputs.self}/mixins/tailscale.nix"
    "${inputs.self}/mixins/openssh.nix"
    "${inputs.self}/mixins/ssh/sk_keys.nix"
    "${inputs.self}/mixins/stlink.nix"
    "${inputs.self}/mixins/nrfjprog-udev.nix"
    "${inputs.self}/mixins/dslogic-udev.nix"
    "${inputs.self}/mixins/md380-udev.nix"
  ];

  virtualisation.docker.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "prodeskalpha";
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  boot.tmp.useTmpfs = true;

  hardware.rtl-sdr.enable = true;

  system.stateVersion = "23.11";
}

