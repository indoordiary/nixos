{ config, ... }:

{
  imports = [
    # ./programs/sudo.nix
    ./programs/doas.nix
    ./programs/fish.nix
    ./programs/grub.nix
    ./programs/nix.nix
    ./programs/plymouth.nix

    ./programs/gnupg.nix
    ./programs/flatpak.nix

    # ./programs/steam.nix
    ./programs/proxy.nix
    ./programs/tlp.nix

    ./programs/firefox.nix

    ./programs/install-system.nix
    ./programs/others.nix
  ];
  
  nixpkgs.config.permittedInsecurePackages = [

  ];

}
