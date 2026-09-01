{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    luvus.url = "github:RizRiyz/luvus";
    flake-parts.url = "github:hercules-ci/flake-parts";
    ez-configs.url = "github:ehllie/ez-configs";
    ez-configs.inputs.nixpkgs.follows = "nixpkgs";
    ez-configs.inputs.flake-parts.follows = "flake-parts";
  };
  outputs =
    inputs@{
      nixpkgs,
      nixos-wsl,
      home-manager,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        {
          formatter = pkgs.nixfmt;
          packages.luvus = inputs.luvus.packages.${system}.default;
        };
      flake =
        let
          system = "x86_64-linux";
          nixosModules = [
            ./configuration.nix
            nixos-wsl.nixosModules.wsl
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.blackmage = ./home.nix;
            }
            {
              nix.registry.nixpkgs.flake = nixpkgs;
              nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
            }
            {
              nixpkgs.overlays = [
                (final: prev: {
                  luvus = inputs.luvus.packages.${system}.default;
                })
              ];
            }
          ];
          mkHost =
            hostName:
            nixpkgs.lib.nixosSystem {
              inherit system;
              modules = nixosModules ++ [ { networking.hostName = hostName; } ];
            };
        in
        {
          nixosConfigurations = {
            nixos = mkHost "nixos";
            SEFIRAH = mkHost "SEFIRAH";
          };
        };
    };
}
