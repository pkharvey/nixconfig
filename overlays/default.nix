{ inputs,  pkgs ,... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  #additions = final: _prev: import ../pkgs { pkgs = final; };
  
  ttf-icomoon-feather =  pkgs.callPackage ../pkgs/ttf-icomoon-feather.nix { };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {};
}
