{ config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./config/boot.nix
      ./config/fonts.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/zramSwap.nix
    ];

  networking.hostName = "RedmiBook";
  
  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "25.05";
  };
} 