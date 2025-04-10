{ config, ... }:
{
  zramSwap = {
    enable = true;
    priority = 100;
    swapDevices = 2;
  };

  swapDevices = [
    { device = "/dev/disk/by-partuuid/8f1d2eb8-2ed9-4ffa-8b69-d1280109aa2"; priority = 10; }
  ];

 services.logind.extraConfig = ''
    HandleLidSwitch=hibernate
    HandleLidSwitchExternalPower=hibernate
    HandleLidSwitchDocked=ignore
    HibernateKeyIgnoreInhibited=no
  '';

}
