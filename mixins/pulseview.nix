{ config, pkgs, lib, inputs, ...}:
{
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      pulseview
      sigrok-firmware-fx2lafw
    ];
  };

  services.udev.packages = [ pkgs.libsigrok ];
}
