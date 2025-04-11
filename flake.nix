{
  description = "Self-managed NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      specialArgs = {
        inherit inputs;
        inherit (inputs) zen-browser;
      };

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
        packages = with pkgs; [
          git
          nixpkgs-fmt
        ];
      };

      nixosConfigurations.ChenHsi-Desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = specialArgs;
        modules = [
          ./configuration/system.nix
          ./configuration/user.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.chenhsi = import ./configuration/home.nix;
          }
          revisionInfo
        ];
      };
    };
}
