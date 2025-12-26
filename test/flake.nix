{
  description = "Mikoshi test configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Reference parent Mikoshi flake
    mikoshi.url = "path:..";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, mikoshi, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        home-manager.nixosModules.home-manager
        mikoshi.nixosModules.default
        ./configuration.nix
        ./hardware-configuration.nix
        {
          mikoshi = {
            username = "cheryllamb";
            hostname = "nixos";
            theme = "akasara";
          };
        }
      ];
    };
  };
}
