{ config, lib, pkgs, ... }:
{
  security.sudo.enable = lib.mkForce false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = [ "chenhsi" ];
        noPass = true;
        keepEnv = true;
      }
    ];
  };

  environment.systemPackages = with pkgs; [ doas-sudo-shim ];
  programs.fish.shellAbbrs = { sudo = "doas"; };
}
