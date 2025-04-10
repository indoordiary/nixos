{ config, pkgs, lib, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "chenhsi";
      };
      default_session = initial_session;
    };
  };

  environment.etc."greetd/environments".text = ''
    niri-session
    cage
    steam-gamescope
    fish
    bash
  '';
}
