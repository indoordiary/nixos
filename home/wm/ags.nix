{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.optional.wm {
    home.packages = with pkgs; [
      ags
      
      #   imagemagick
      #   hyprpicker
      wayshot
      #   swappy

      #   wf-recorder
      wl-screenrec
      slurp

      wl-clipboard
      cliphist
  
      brightnessctl
      inotify-tools
      libnotify
      
      wlr-randr
      
      #   sassc  
    ];
  };
}
