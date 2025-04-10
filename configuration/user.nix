{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.chenhsi = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbuser" "audio" "video" "input" "docker" "networkmanager" ];
      useDefaultShell = true;
      hashedPassword = "$y$j9T$n/ymRgCEJ.hDWTIbs1zgy.$DScp0RP5zKv4AZJfEKy5nxQQqL0JZkoBHccbTh5xco1";
    };
  };

  security.pam.services.chenhsi.gnupg.enable = true;
}
