{ inputs, outputs, lib, config, pkgs, share, ... }:
{
  xdg.configFile = {
    waybar.source = ./waybar;
    MangoHud.source = ./MangoHud;
  };
}
