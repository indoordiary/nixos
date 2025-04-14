{ config, pkgs, lib, ... }:
{

  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;
    };

    graphics = {
      enable = true;
      extraPackages  = with pkgs; [ mesa ];
      enable32Bit = true;
      extraPackages32 = with pkgs.driversi686Linux;[ mesa ];
    };

    amdgpu = {
      amdvlk.enable = true;
      initrd.enable = true;
      opencl.enable = true;
    };

    cpu.amd.updateMicrocode = true;

    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

}
