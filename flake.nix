{
  description = "A NixOS flake for pkharvey's personal computer.";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      newtoncrosby = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
        modules = [
          (import ./hosts/newtoncrosby/configuration.nix)
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

