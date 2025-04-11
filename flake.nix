{
  description = "Self-managed NixOS Configuration";

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

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      revisionInfo = {
        system.configurationRevision = self.rev or null;
        system.nixos.label = with builtins;
          if self.sourceInfo ? lastModifiedDate && self.sourceInfo ? shortRev
          then "${substring 0 8 self.sourceInfo.lastModifiedDate}.${self.sourceInfo.shortRev}"
          else "dirty";
      };
    in
    {
      nixosConfigurations.ChenHsi-Desktop = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = 
          ./configuration/system.nix
          ./configuration/user.nix
          ./configuration/programs.nix
          ./configuration/desktop/niri.nix
          ./configuration/device/RBP152022.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              
              users.chenhsi = {
                imports =  ./configuration/home.nix ;
              };
              
               关键修正：传递完整 inputs 对象
              extraSpecialArgs = { 
                inherit inputs; 
                inherit (inputs) zen-browser; 
              };
            };
          }

          revisionInfo
        ;

         系统层级的参数传递
        specialArgs = { inherit inputs; };
      };
    };
}写法对吗？
