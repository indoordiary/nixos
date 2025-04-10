{ config, pkgs, lib, ... }:

{
  networking.networkmanager.enable = lib.mkForce false;

  services.connman = {
    enable = true;
    enableVPN = true;
    wifi.backend = "iwd";
  };

  environment.systemPackages = with pkgs; [ cmst ];
}
