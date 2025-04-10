{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      genRev = {
        system.configurationRevision = self.rev or null;
        system.nixos.label = with builtins;
          if self.sourceInfo ? lastModifiedDate && self.sourceInfo ? shortRev
          then "${substring 0 8 self.sourceInfo.lastModifiedDate}.${self.sourceInfo.shortRev}"
          else "dirty";
      };
    in {
      nixosConfigurations.ChenHsi-Desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { 
          inherit inputs;
          lib = nixpkgs.lib;
        };
        
        modules = [
          ./configuration/system.nix
          ./configuration/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix
          ./configuration/device/RBP152022.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.chenhsi = { pkgs, inputs, lib, ... }: 
                import ./configuration/home.nix { 
                  inherit inputs pkgs lib;  # 关键：传递所有参数
                };
              backupFileExtension = "backup";
            };
          }
          
          genRev
        ];
      };
      
      homeConfigurations.chenhsi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./configuration/home.nix ];
      };
    };
}
