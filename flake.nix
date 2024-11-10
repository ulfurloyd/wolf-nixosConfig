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
        wm = "bspwm";
        browser = "zen";
        term = "kitty";
        editor = "nvim";
      };

      pythonPackages = pkgs.python311Packages;

    in {
    nixosConfigurations = {
      wolfNix = lib.nixosSystem {
        inherit system;
        modules = [ inputs.stylix.nixosModules.stylix ./configuration.nix ];

        specialArgs = {
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
      wolf = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit userSettings;
        };
        modules = [ 
          inputs.stylix.homeManagerModules.stylix
	        ./home.nix
	        nixvim.homeManagerModules.nixvim
          inputs.spicetify-nix.homeManagerModules.default
        ];
      };
    };

    devShell.${system} = pkgs.mkShell {
      buildInputs = [
        pythonPackages.dbus-python
      ];
    };
    nix = {
      allowDirty = true;
    };
  };
}
