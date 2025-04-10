{ config, pkgs, lib, ... }:
{
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = "/etc/mihomo.yaml";
  };
  
  programs.proxychains = {
    enable = true;
    proxies = {
      default = {
        type = "http";
        host = "127.0.0.1";
        port = 20172;
      };
    };
  };
}
