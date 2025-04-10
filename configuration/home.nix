{ config, pkgs, lib, inputs, ... }:
let
  zen-browser-pkg = inputs.zen-browser.packages.${pkgs.system}.beta;
in
{
  imports = [
    (import ./programs/install-user.nix { 
      inherit pkgs inputs; 
    })
  ];

  programs.home-manager.enable = true;
  home.username = "chenhsi";
  home.homeDirectory = "/home/chenhsi";
  home.stateVersion = "25.05";

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  xdg = {
    enable = true;
    userDirs.enable = true;
    configFile = {
      ".nix-channels".source = ./dotfiles/.nix-channels;
      "waybar/config".source = ./dotfiles/waybar-config;
      "waybar/style.css".source = ./dotfiles/waybar-style.css;
      "niri/config.kdl".source = ./dotfiles/niri-config.kdl;
      "alacritty.toml".source = ./dotfiles/alacritty.toml;
      "mako/config".source = ./dotfiles/mako-config;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
    ];
  };
  
  home.activation.installPackages = {
    data = lib.mkForce "";
    before = lib.mkForce [];
    after = lib.mkForce [];
  };

  home.file = {
    nix-profile = {
      source = config.home.path;
      target = ".nix-profile";
    };
  };
}
