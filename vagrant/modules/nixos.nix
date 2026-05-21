{ lib, ... }:
let
  inherit (lib) mkForce ;
in {

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  documentation.doc.enable = false;
  documentation.info.enable = false;
  documentation.man.enable = false;
  documentation.nixos.enable = false;
  i18n.supportedLocales = mkForce [ "en_US.UTF-8/UTF-8" ];
  networking.firewall.allowPing = true;
  networking.firewall.enable = true;
  networking.firewall.pingLimit = "--limit 1/second --limit-burst 5";
  nix.gc.automatic = true;
  nix.gc.options = "-d";
  nix.settings.allowed-users = [];
  security.polkit.enable = false;
  security.sudo.wheelNeedsPassword = true;
  services.openssh.authorizedKeysFiles = mkForce [ "/etc/ssh/authorized_keys.d/%u" ];
  services.openssh.settings.KbdInteractiveAuthentication = false;
  services.openssh.settings.PasswordAuthentication = false;
  services.udisks2.enable = false;

  # XXX default logout breaks Vagrant: https://github.com/NixOS/nixpkgs/issues/521679
  programs.bash.logout = ''
    if [ -n "$PS1" ]; then
      printf '\e]0;\a' >&2
    fi
  '';

}

