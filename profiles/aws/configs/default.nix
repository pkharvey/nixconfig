{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: "./${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  xdg.configFile = {
    hypr.source = wrap "hypr";
    kitty.source = wrap "kitty";
    fish.source = wrap "fish";
    omf.source = wrap "omf";
    waybar.source = wrap "waybar";
    MangoHud.source = wrap "MangoHud";
    "gtk-3.0".source = wrap "gtk-3.0";
    "gtk-4.0".source = wrap "gtk-4.0";
  };
}
