{ config, pkgs, lib, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = lib.mkForce "iwd";
    };
  };
}
