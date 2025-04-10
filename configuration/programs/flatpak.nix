{ config, pkgs, lib, ... }:

{
  xdg.portal = {
    enable = true;
  };

  services.flatpak.enable = true;

  system.fsPackages = [ pkgs.bindfs ];

  fileSystems = let
    mkRoSymBind = path: {
      device = path;
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };

    aggregatedIcons = pkgs.buildEnv {
      name = "system-icons";
      paths = with pkgs; [
        adwaita-icon-theme
        papirus-icon-theme
        graphite-cursors
      ];
      pathsToLink = [ "/share/icons" ];
    };

     aggregatedThemes = pkgs.buildEnv {
      name = "system-themes";
      paths = with pkgs; [
        orchis-theme
      ];
      pathsToLink = [ "/share/themes" ];
    };

    aggregatedFonts = pkgs.buildEnv {
      name = "system-fonts";
      paths = config.fonts.packages;
      pathsToLink = [ "/share/fonts" ];
    };

  in {
    "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
    "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
    "/usr/share/themes" = mkRoSymBind "${aggregatedThemes}/share/themes";
  };
}
