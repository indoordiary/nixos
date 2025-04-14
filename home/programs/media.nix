{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      #ikun-music-desktop
      pavucontrol
      #vutron-music
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
