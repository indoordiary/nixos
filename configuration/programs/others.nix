{ config, lib, ... }:
{
  programs = {
    command-not-found.enable = true;
    dconf.enable = true;
    adb.enable = true;
    git.enable = true;

    coolercontrol.enable = true;
    gamemode.enable = true;
    wshowkeys.enable = false;

    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  virtualisation.waydroid.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  documentation.nixos.enable = false;
}
