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
    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      vulkan-tools
      ];
    };
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };
  
  boot.initrd.kernelModules = [ "amdgpu" ];
}
