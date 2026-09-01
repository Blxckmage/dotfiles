{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.within.gpg;
in
{
  options.within.gpg.enable = mkEnableOption "gpg config";

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnupg ];

    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableZshIntegration = true;
      pinentry.package = pkgs.pinentry-curses;
      extraConfig = "allow-loopback-pinentry";
    };
  };
}
