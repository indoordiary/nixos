{
  lib,
  config,
  pkgs,
  ...
}:
let
  cursor = "Bibata-Modern-Classic-Hyprcursor";
  cursorPackage = pkgs.bibata-hyprcursor;
in
{
  imports = [

    ./binds.nix
    ./rules.nix
    ./settings.nix
  ];
  config = lib.mkIf config.optional.hypr.enable {
    home.packages = with pkgs; [
      networkmanagerapplet
      qt6.qtwayland
      libsForQt5.qt5.qtwayland

      # screenshot
      grimblast
    ];

    xdg.dataFile."icons/${cursor}".source = "${cursorPackage}/share/icons/${cursor}";

    # fake a tray to let apps start
    # https://github.com/nix-community/home-manager/issues/2064
    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };

    home.sessionVariables = {
      # Wayland 基础环境
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";

      # GTK 缩放
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";

      # QT 缩放
      # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    };


    catppuccin.hyprland.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
