{ config, pkgs, lib, inputs, ...}:
{
  home-manager.users.pasha = { pkgs, ... }: {
    home.packages = with pkgs; [
      gqrx
      svxlink     # has qtel
    ];
  };
}
