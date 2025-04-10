{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ steam-run ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      gamescope
      zulu
    ];
  };

  programs.nix-ld = {
    enable = true;
    libraries = pkgs.steam-run.fhsenv.args.multiPkgs pkgs;
  };

  hardware.steam-hardware.enable = true;

}
