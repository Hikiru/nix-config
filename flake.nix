{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      myLib = import ./myLib { inherit lib; };
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        anura = lib.nixosSystem {
          specialArgs = { inherit inputs myLib; };
          modules = [
            ./hosts/anura/configuration.nix
            ./nixosModules
          ];
        };
        malus = lib.nixosSystem {
          specialArgs = { inherit inputs myLib; };
          modules = [
            ./hosts/malus/configuration.nix
            ./nixosModules
          ];
        };
      };
      homeConfigurations.hikiru = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs myLib; };
        modules = [
          ./homeManager/home.nix
        ];
      };
    };
}
