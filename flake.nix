{
  description = "Modular flake for my desktop and laptop systems";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

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

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixvim,  ... }:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      
      userSettings = {
        username = "wolf";
        email = "eklavyasood@gmail.com";
        dotfilesDir = "~/.dotfiles";
        shell = "zsh";
        theme = "bleak-cabin";
        wm = "bspwm";
        browser = "zen";
        term = "kitty";
        editor = "nvim";
        musicPlayer = "spotify";
        font = "Fira Serif";
      };
    in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        inherit system;
        modules = [ 
          inputs.stylix.nixosModules.stylix
          ./hosts/desktop/desktop.nix
          ./hosts/common/common.nix
        ];

        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };

      laptop = lib.nixosSystem {
        inherit system;
        modules = [ 
          inputs.stylix.nixosModules.stylix
          ./hosts/laptop/laptop.nix
          ./hosts/common/common.nix
        ];

        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };
    };

    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [ 
          inputs.stylix.homeManagerModules.stylix
	        ./hosts/desktop/home.nix
          ./hosts/common/home.nix
	        nixvim.homeManagerModules.nixvim
          inputs.spicetify-nix.homeManagerModules.default
        ];
      };

      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [ 
          inputs.stylix.homeManagerModules.stylix
	        ./hosts/laptop/home.nix
          ./hosts/common/home.nix
	        nixvim.homeManagerModules.nixvim
          inputs.spicetify-nix.homeManagerModules.default
        ];
      };
    };
  };
}
