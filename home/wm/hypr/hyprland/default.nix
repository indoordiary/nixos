{ lib, config, pkgs, ... }:
let
  cursor = "Bibata-Modern-Classic-Hyprcursor";
  cursorPackage = pkgs.bibata-hyprcursor;
in
{
  imports = [ ./binds.nix ./rules.nix ./settings.nix ];

  config = lib.mkIf config.optional.hypr.enable {
    home.packages = with pkgs; [
      networkmanagerapplet
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
      grimblast
    ];

    # 设置光标主题
    xdg.dataFile."icons/${cursor}".source = "${cursorPackage}/share/icons/${cursor}";

    # 系统托盘配置
    systemd.user.targets.tray = {
      Unit = {
        Description = "Home Manager System Tray";
        Requires = [ "graphical-session-pre.target" ];
      };
    };

    # 环境变量（关键修改！）
    home.sessionVariables = {
      GDK_SCALE = "2";               # GTK 全局缩放
      GDK_DPI_SCALE = "0.5";          # 防止 GTK 字体过小
      QT_SCALE_FACTOR = "2";          # QT 全局缩放
      QT_ENABLE_HIDPI= "1"; # QT 自动适配屏幕缩放
      XCURSOR_SIZE = "32";            # 光标大小
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };

    # Hyprland 主配置（关键修改！）
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      settings = {
        env = [
          "GDK_BACKEND,wayland,x11"
        ];
        exec-once = [
          "hyprctl setcursor ${cursor} 32"
          "xprop -root -f XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set XWAYLAND_GLOBAL_OUTPUT_SCALE 2" 
        ];
      };
    };

    catppuccin.hyprland.enable = true;
  };
}
