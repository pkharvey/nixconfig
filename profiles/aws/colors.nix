{ inputs, outputs, lib, config, pkgs, ... }:
{
  colorScheme = inputs.nix-colors.colorSchemes.nord;

    services = { 

    mako = with config.colorScheme.colors; {
    	backgroundColor = base01;
    	borderColor = base0E;
    	textColor = base04;
    };
};
 
}
