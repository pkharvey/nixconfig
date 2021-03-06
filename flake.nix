{
  description = "A NixOS flake for pkharvey's personal computer.";

  inputs = {
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    nixinate.url = "github:matthewcroughan/nixinate";
    home-manager.url = "github:nix-community/home-manager";
    robotnix.url = "github:danielfullmer/robotnix";
    firefox = {
      url = "github:colemickens/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, robotnix, firefox, nixinate, ... }@inputs: {

    apps = nixinate.nixinate.x86_64-linux self;

    # Applies the function `robotnixSystem` to each of the attributes in the
    # set, for example `hlte`. This means I can have a set of phones to build.
    robotnixConfigurations = nixpkgs.lib.mapAttrs (n: v: inputs.robotnix.lib.robotnixSystem v) {
      brownstone = import ./hosts/brownstone/default.nix;
      #anotherPhone = import ./hosts/anotherPhone/default.nix;
    };

    nixosConfigurations = {
      newtoncrosby = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
        modules = [
          (import ./hosts/newtoncrosby/configuration.nix)
          home-manager.nixosModules.home-manager
          {
            _module.args.nixinate = {
              host = "newtoncrosby";
              sshUser = "pasha";
              buildOn = "remote";
            };
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
      ptpx220 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/ptpx220/configuration.nix)
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

