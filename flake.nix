{
  #https://github.com/PROxZIMA/.dotfiles/
  description = "A NixOS flake for Aws.";

  inputs = {
    hyprland.url = "github:hyprwm/Hyprland"; 

    nixos-hardware.url = "github:nixos/nixos-hardware";

    nixpkgs.url = "github:/nixos/nixpkgs/nixos-unstable";

    hyprland-contrib.url = "github:hyprwm/contrib";
    nix-colors.url = "github:misterio77/nix-colors";


    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self , nixpkgs, home-manager, nixos-hardware, ... }@inputs:
  {
    overlays = import ./overlays { inherit inputs; };
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home;

    nixosConfigurations = {
      aws = nixpkgs.lib.nixosSystem {    
        system = "x86_64-linux";
	specialArgs = { inherit inputs; }; # this is the important part
        modules = [ 
	            ./hosts/aws 
		    home-manager.nixosModules.home-manager
                       {
                          home-manager.useGlobalPkgs = true;
                          home-manager.useUserPackages = true;
                          home-manager.users.aws = import ./profiles/aws;
			  home-manager.extraSpecialArgs = {inherit inputs;};
			}
	          ];
    };
   };
 };
}
