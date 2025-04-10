{config, pkgs, lib, ...}:
  
{
  imports = [
    ./input/fcitx5.nix
    ./services/greetd.nix
    ./services/connman.nix
    ./services/qt6ct.nix
  ];
 
  environment.systemPackages = with pkgs; [
    nemo-with-extensions alacritty mate.engrampa
    pavucontrol gtklock xdg-desktop-portal-gnome
    swaybg waypaper
    xwayland-satellite xwayland-run cage labwc
    poweralertd lxappearance-gtk2 mako fuzzel waybar brightnessctl
  ];

  programs.xwayland.enable = true;
  programs.niri.enable = true;
  
  security = {
    polkit = {
      enable = true;
      extraConfig = ''
        /* Allow any local user to do anything (dangerous!). */
        polkit.addRule(function(action, subject) {
          if (subject.local) return "yes";
        });
      '';
    };
    pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };

  services = {
    gnome.gnome-keyring.enable = true;
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gvfs.enable = true;
    seatd.enable = true;
  };

  # programs.fish.shellAbbrs = { xwayland = "Xwayland & env DISPLAY=:0 openbox"; };
  
  systemd.user.services = {
    swaybg = {
      description = "swaybg";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          ExecStart = "${pkgs.swaybg}/bin/swaybg";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
  };
  

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "Alacritty.desktop"
        ];
      };
    };
    autostart.enable = true;
  };
  
}
