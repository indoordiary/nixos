{ config, lib, pkgs, ... }:
{
  # Graphic Card
  boot.extraModprobeConfig = ''
      options amdgpu.dc=1
      options amdgpu.dpm=1
      options amdgpu.audio=1
    '';

  hardware.cpu.amd.updateMicrocode = true;
  hardware.opengl = {
      enable = true;
      extraPackages = with pkgs; [
        vulkan-tools
        vulkan-validation-layers
        mesa
        amdvlk
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        mesa.drivers
        vulkan-loader
        pkgs.driversi686Linux.amdvlk
      ];
    };
}
