{ config, lib, ... }:
{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = lib.mkForce false;
  };
}
