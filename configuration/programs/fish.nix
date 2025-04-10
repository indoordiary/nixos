{ config, pkgs, ... }:
{
  users.defaultUserShell = pkgs.fish;
  
  environment.systemPackages = with pkgs; [
    btop bat tealdeer du-dust fd eza tokei duf
    helix
  ];
  
  programs.fish = {
    enable = true;
    shellAbbrs = {
      backup = "git commit --all -m update. && git push";
      rebuild = "sudo nixos-rebuild switch --flake .#";
      rebuild-boot = "sudo nixos-rebuild boot --flake .#";
      update = "cd /etc/nixos && nix flake update && sudo nixos-rebuild switch --flake .#";
      clean = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      shutdown = "systemctl poweroff";
      reboot = "systemctl reboot";

      cat = "bat";
      htop = "btop";
      tldr = "tealdeer";
      du = "dust";
      find = "fd";
      ls = "exa";
      df = "duf";

      nvim = "hx";
      vim = "hx";
      vi = "hx";
      helix = "hx";
    };
    interactiveShellInit = ''
      fastfetch
    '';
    vendor = {
      functions.enable = true;
      config.enable = true;
      completions.enable = true;
    };
  };
}
