{
  description = "A NixOS flake for pkharvey's personal computer.";

  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    };

    nixosConfigurations = {
      aws = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
        modules = [
          (import ./hosts/aws/configuration.nix)
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.common-cpu-intel
          {
            _module.args.nixinate = {
              host = "aws";
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aws= {
              home.username = "aws";
              home.stateVersion = "22.11";
              home.homeDirectory = "/home/aws";
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
}

