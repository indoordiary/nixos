{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nordic
    orchis-theme
    # vimix-gtk-themes

    papirus-icon-theme
    adwaita-icon-theme

    # tela-circle-icon-theme
    # tela-icon-theme

    graphite-cursors
  ];
}
