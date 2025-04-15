{ pkgs, ... }:
{
  services = {
    # getty.autologinUser = "${user}";
    upower.enable = true;
    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = [ pkgs.gcr ];
    power-profiles-daemon.enable = true;
    gnome.gnome-keyring.enable = true;

    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              rightalt = "layer(alt)";
              "tab+l" = "capslock";
            };
          };
        };
      };
    };
    
    logind = {
      extraConfig = ''
        HandlePowerKey=suspend  # 短按休眠
        HandlePowerKeyLongPress=poweroff  # 长按关机
        HandleLidSwitch=hibernate  #合盖休眠
        HandleLidSwitchExternalPower=hibernate  # 电源接通时合盖仍然休眠
        HandleLidSwitchDocked=ignore  # 连接拓展坞时忽略盖子开关事件
        HibernateKeyIgnoreInhibited=no  #休眠键守护
      '';
   };

  };
}
