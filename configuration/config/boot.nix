{ config, lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod;

    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 10;
      };
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
    
    kernelParams = [ 
      # 休眠设置
      "amd_pstate=passive"
      "resume=/dev/disk/by-partuuid/8f1d2eb8-2ed9-4ffa-8b69-d1280109aa2" 
       # 禁用休眠
       # "nohibernate"
      ];

  };
}
