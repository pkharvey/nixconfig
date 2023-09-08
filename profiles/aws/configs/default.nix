{ inputs, outputs, lib, config, pkgs, share, ... }:
{
  xdg.configFile = {
    hypr.source = ./hypr;
    kitty.source = ./kitty;
    waybar.source = ./waybar;
    MangoHud.source = ./MangoHud;
  };
}
