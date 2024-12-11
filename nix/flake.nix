{
  description = "Saif's nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-25.05";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew/e048b6646bc275341e0a854fa06168cec4c33962";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, homebrew-core, homebrew-cask, ... }:
  let configuration = { pkgs, ... } : {
      system.stateVersion = 5;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      nix.settings.experimental-features = "nix-command flakes";
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
    user = "slatifi";
  in {
    darwinConfigurations."Firebolt" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        ./darwin/common.nix
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        {
          # Darwin configuration
          system.primaryUser = user;
          darwin.user = user;

          # Home Manager configuration
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = {imports = [./home/common.nix ./home/darwin.nix];};
          home-manager.extraSpecialArgs = { inherit user; homeStructure = "/Users"; };

          # Brew configuration
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = user;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            autoMigrate = true;
          };
        }
      ];
    };
    nixosConfigurations."snape" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          # Home Manager configuration
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = {imports = [./home/common.nix ./home/nixos.nix];};
          home-manager.extraSpecialArgs = { inherit user; homeStructure = "/home"; };
        }
      ];
    };
  };
}
