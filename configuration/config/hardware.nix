{ config, pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    opengl = {
    enable = true;
    driSupport32Bit = true;
    };
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };
}
