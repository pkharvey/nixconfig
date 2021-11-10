{
  description = "A NixOS flake for pkharvey's personal computer.";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      newtoncrosby = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
        modules = [
          (import ./hosts/newtoncrosby/configuration.nix)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pasha = {
              home.username = "pasha";
              home.homeDirectory = "/home/pasha";
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

