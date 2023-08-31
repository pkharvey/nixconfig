{
  description = "A NixOS flake for Aws.";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland"; 
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-contrib.url = "github:hyprwm/contrib";
  };

  outputs = { self , nixpkgs, home-manager, nixos-hardware, ... }@inputs: {

    nixosConfigurations = {
      aws = nixpkgs.lib.nixosSystem {    # this is the hostname = some func
        system = "x86_64-linux";
	specialArgs = { inherit inputs; }; # this is the important part
        modules = [
          ./hosts/aws/configuration.nix
          home-manager.nixosModules.home-manager
          #nixos-hardware.nixosModules.common-cpu-intel
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aws= {
              home.username = "aws";
              home.stateVersion = "22.11";
              home.homeDirectory = "/home/aws";
            };
          }
        ];
      };
   };
};
}
