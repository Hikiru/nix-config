{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-xr,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      myLib = import ./myLib { inherit pkgs; };
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations =
        let
          hosts = builtins.attrNames (builtins.readDir ./hosts);

          mkHost =
            hostName:
            lib.nixosSystem {
              specialArgs = { inherit inputs myLib; };
              modules = myLib.recursivelyImport [
                (./hosts + "/${hostName}")
                ./nixosModules
                nixpkgs-xr.nixosModules.nixpkgs-xr
              ];
            };
        in
        lib.genAttrs hosts mkHost;
    };
}
