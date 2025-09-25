{ pkgs, lib, ... }:
{
  services.printing = {
    enable = true;
    browsing = true;
    stateless = true;
    drivers = with pkgs; [
      hplipWithPlugin
      gutenprint
    ];
  };

  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
  #  "hplip"
  #];
}
