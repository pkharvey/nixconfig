{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./zfs-requirements.nix
    "${inputs.self}/mixins/locale.nix"
    "${inputs.self}/mixins/sway"
    "${inputs.self}/mixins/audio.nix"
    "${inputs.self}/mixins/users/pasha.nix"
    "${inputs.self}/mixins/users/disableMutableUsers.nix"
    "${inputs.self}/mixins/printing.nix"
    "${inputs.self}/mixins/common.nix"
    "${inputs.self}/mixins/tailscale.nix"
    "${inputs.self}/mixins/openssh.nix"
    "${inputs.self}/mixins/ssh/sk_keys.nix"
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "prodeskalpha";

  system.stateVersion = "22.05";
}

