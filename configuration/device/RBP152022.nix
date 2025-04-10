{ config, lib, pkgs, ... }:
{
  # Graphic Card
  boot.extraModprobeConfig = ''
      options amdgpu.dc=1
      options amdgpu.dpm=1
      options amdgpu.audio=1
    '';

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.cpu.amd.updateMicrocode = true;
  hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vulkan-tools
        vulkan-validation-layers
        mesa
        libva-mesa-driver
        mesa-vulkan-drivers
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-mesa-driver
        mesa-vulkan-drivers
      ];
    };
}
