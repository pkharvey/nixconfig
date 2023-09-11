{ inputs, outputs, lib, config, pkgs, ... }:
{
  nix-colors.colorSchemes.nord;

    services = {

    mako = with config.colorScheme.colors; {
    	backgroundColor = "#${base01}";
    	borderColor = "#${base0E}";
    	textColor = "#${base04}";
    };

  };




  programs = {
    
    kitty.settings = {
        foreground = "#${config.colorScheme.colors.base05}";
        background = "#${config.colorScheme.colors.base00}";
      };
  };
 
}