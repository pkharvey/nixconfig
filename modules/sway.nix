{ pkgs, lib, config, ... }:

{
  programs.sway.enable = true;
  environment.systemPackages = [
    pkgs.alacritty
  ];
}
