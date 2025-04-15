{ lib, config, ... }:

lib.mkIf config.optional.podman {

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.settings = {
      dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    lazydocker
  ];

  virtualisation.waydroid.enable = true;

  boot.kernel.sysctl."user.max_user_namespaces" = 16384;
}
