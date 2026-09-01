{
  config,
  lib,
  pkgs,
  ...
}:

{
  wsl.enable = true;
  wsl.defaultUser = "blackmage";

  networking.hostName = lib.mkDefault "SEFIRAH";

  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/blackmage/.dotfiles/nixos";
  };

  users.users.blackmage.shell = pkgs.zsh;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "mongodb-ce"
      "mongosh"
      "mongodb-ce-unwrapped"
    ];
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  security.sudo.extraConfig = "Defaults env_keep+=\"EDITOR VISUAL\"";
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    gcc
    gnumake
    luvus
  ];

  fonts.packages = with pkgs; [ kode-mono ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "Kode Mono" ];
  };

  system.stateVersion = "26.05";
}
