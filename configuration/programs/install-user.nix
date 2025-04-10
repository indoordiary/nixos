{ pkgs, ... }:
{
  imports = [
    ../desktop/theme/default.nix
  ];

  home.packages = with pkgs; [
    qqmusic
    bilibili

    qq
    wechat-uos
    telegram-desktop
    
    wpsoffice-cn
    vscode-fhs
    typora

    inputs.zen-browser.packages.${system}.beta
  ];
}
