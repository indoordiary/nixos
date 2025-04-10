{
  description = "self-using configuration.";

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

  outputs = { self, nixpkgs, home-manager,  zen-browser, ... }:

    (let
      system = "x86_64-linux";
      genRev = {
        system.configurationRevision = self.rev or null;
        system.nixos.label =
          with builtins;
            if self.sourceInfo ? lastModifiedDate && self.sourceInfo ? shortRev
            then "${substring 0 8 self.sourceInfo.lastModifiedDate}.${self.sourceInfo.shortRev}"
            else "dirty";
      };

    in {
      nixosConfigurations.ChenHsi-Desktop = nixpkgs.lib.nixosSystem {
      
        inherit system;

        modules = [
          ./configuration/system.nix
          ./configuration/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix
          ./configuration/device/RBP152022.nix

          home-manager.nixosModules.home-manager
     	    {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.chenhsi = import ./configuration/home.nix{ inherit inputs; };
            home-manager.backupFileExtension = "backup";
           }

          genRev
        ];
    };
  });
}
