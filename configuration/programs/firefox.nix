{ config, pkgs, ... }:
{

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
    languagePacks = [ "zh-CN" ];
    preferencesStatus = "user";
    nativeMessagingHosts.packages =with pkgs; [
      browserpass
    ];
  };

}
