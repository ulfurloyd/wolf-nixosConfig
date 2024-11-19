{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    spicetifyPackage = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".spicetify-cli;
    enabledExtensions = with spicePkgs.extensions; [ ];
    # theme = {
    #   name = "base16-spotify";
    #   src = pkgs.fetchFromGithub {
    #     owner = "Misterio77";
    #     repo = "base16-spotify";
    #     rev = "";
    #     hash = "";
    #   };
    # };
  };
}
