{ config, pkgs, lib, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    gnumake42
  ];
  nix = {
    package = pkgs.nixVersions.git;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
    settings.trusted-users = [ "@wheel" "root" ];
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
