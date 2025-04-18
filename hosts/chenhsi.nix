{ pkgs, ... }:
{
  imports = [ ./common ];

  profile = {
    terminal = "foot";
    font = "MonoLisa";
    darkMode = false;
    browser = "firefox";
    wallpaper = "${pkgs.wallpaper}/charlotte.jpg";
  };

  optional = {
    cosmic = false;
    wm = true;
    hypr = {
      enable = true;
    };
    niri = false;

    podman = false;

    terminal = {
      foot = true;
      kitty = false;
      wezterm = false;
    };

    dev = {
      helix = false;
      zed = true;
      vscode = true;

      rust = true;
      go = false;
      node = true;
      zig = false;
    };
  };

}
