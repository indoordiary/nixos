{ pkgs, ... }:
{
  imports = [
    ../desktop/theme/default.nix
  ];
  
  inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  home.packages = with pkgs; [
    yesplaymusic
    qqmusic
    bilibili

    qq
    wechat-uos
    telegram-desktop
    
    wpsoffice-cn
    vscode-fhs
    
    inputs.zen-browser.packages.${system}.beta
  ];
}
