{ config, ... }:
{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/nvme0n1p5";
        efiSupport = true;
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
}
