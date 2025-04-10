{ pkgs, ... }:
{
  imports = [
    ../desktop/theme/default.nix
  ];

  home.packages = with pkgs; [
    yesplaymusic
    qqmusic
    bilibili

    qq
    wechat-uos
    telegram-desktop
    
    wpsoffice-cn
    vscode-fhs
    typora

    inputs.zen-browser.packages.${pkgs.system}.beta
  ];
}
