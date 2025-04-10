{ config, ... }:

{
  imports = [
    ./programs/fish.nix
    ./programs/grub.nix
    ./programs/firefox.nix
    ./programs/tlp.nix
  ];
  
  nixpkgs.config.permittedInsecurePackages = [

  ];

}
