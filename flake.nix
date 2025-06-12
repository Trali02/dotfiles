{
  description = "Tralis nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input  
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#Nurture'
      nixosConfigurations = {
        Nurture = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [ ./nixos/Nurture/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#trali@Nurture'
      homeConfigurations = {
        "trali@Nurture" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          # > Our main home-manager configuration file <
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
