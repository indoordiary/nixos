{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.chenhsi = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbuser" "uucp" "audio" "video" "libvirtd" "kvm" "input" "seat" ];
      useDefaultShell = true;
      hashedPassword = "$6$8/ZJ0jr/BWf4at92$PmRuEML2eiCHcRe/vuc54xgSkU.T7bO6ljUqczhkpw3kAv1mTl.PLMOhRuG.yIiEklJGwcHq3szit4PPkZaEM0";
    };
  };

  security.pam.services.chenhsi.gnupg.enable = true;
}
