{
  description = "Self-managed NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      revisionInfo = {
        system.configurationRevision = self.rev or "dirty";
        system.nixos.label = 
          if (self ? dirtyRev || !(self ? rev)) 
          then "dirty"
          else builtins.substring 0 7 self.rev;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [ git nixpkgs-fmt ];
      };

      nixosConfigurations.ChenHsi-Desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs zen-browser; };

        modules = [
          ./configuration/system.nix
          ./configuration/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix
          ./configuration/device/RBP152022.nix

          ({ 
            imports = [ home-manager.nixosModules.home-manager ];
            config.home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.chenhsi.imports = [ ./configuration/home.nix ];
              extraSpecialArgs = { inherit inputs zen-browser; };
            };
          })

          revisionInfo
        ];
      };
    };
}
