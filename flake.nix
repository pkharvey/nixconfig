{
  description = "A NixOS flake for pkharvey's personal computer.";

  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    nixinate.url = "github:matthewcroughan/nixinate";
    home-manager.url = "github:nix-community/home-manager";
    robotnix.url = "github:danielfullmer/robotnix";
    firefox = {
      url = "github:colemickens/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waveforms.url = "github:liff/waveforms-flake";
  };

  outputs = { self, nixpkgs, home-manager, robotnix, firefox, waveforms, nixinate, nixos-hardware, ... }@inputs: {

    apps = nixinate.nixinate.x86_64-linux self;

    # Applies the function `robotnixSystem` to each of the attributes in the
    # set, for example `hlte`. This means I can have a set of phones to build.
    robotnixConfigurations = nixpkgs.lib.mapAttrs (n: v: inputs.robotnix.lib.robotnixSystem v) {
      brownstone = import ./hosts/brownstone/default.nix;
      #anotherPhone = import ./hosts/anotherPhone/default.nix;
    };

    nixosConfigurations = {
      prodeskalpha = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
        modules = [
          (import ./hosts/prodeskalpha/configuration.nix)
          home-manager.nixosModules.home-manager
          nixos-hardware.nixosModules.common-cpu-intel
          {
            _module.args.nixinate = {
              host = "prodeskalpha";
              sshUser = "pasha";
              buildOn = "remote";
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pasha = {
              home.username = "pasha";
              home.stateVersion = "22.11";
              home.homeDirectory = "/home/pasha";
            };
          }
          waveforms.nixosModule
          ({ nixpkgs.config.allowUnfree = true; })
        ];
        specialArgs = { inherit inputs; };
      };
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
              home.stateVersion = "22.11";
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
              home.stateVersion = "22.11";
              home.homeDirectory = "/home/pasha";
            };
          }
          waveforms.nixosModule
          ({ nixpkgs.config.allowUnfree = true; })
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}

