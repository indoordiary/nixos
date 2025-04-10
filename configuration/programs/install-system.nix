{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    fastfetch
    
    xorg.xrandr
    wl-clipboard
    wlr-randr

    unzip
    unrar
    p7zip

    sof-firmware
  ];
}
