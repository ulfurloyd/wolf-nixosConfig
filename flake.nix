{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix = {
      url = "github:danth/stylix/release-24.05";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wezterm.url = "github:wez/wezterm?dir=nix";

    zen-browser.url = "github:MarceColl/zen-browser-flake";

  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixvim, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      wolfNix = lib.nixosSystem {
        inherit system;
        modules = [ inputs.stylix.nixosModules.stylix ./configuration.nix ];
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      wolf = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        inherit pkgs;
        modules = [ 
          inputs.stylix.homeManagerModules.stylix
	        ./home.nix
	        nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
