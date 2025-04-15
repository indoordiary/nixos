{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      ikun-music-desktop
      pavucontrol
      vutron-music

      (writeShellScriptBin "qqmusic" ''
      QT_QPA_PLATFORM=wayland \
      exec ${pkgs.qqmusic}/bin/qqmusic \
        --disable-gpu \
        --disable-software-rasterizer \
        --in-process-gpu
    '')
    
    ];
  };

  catppuccin.mpv.enable = true;
  programs = {
    mpv = {
      enable = true;

      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };

    # cava = {
    #   enable = true;
    #
    # };
  };
}
