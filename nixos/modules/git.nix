{ lib, config, ... }:
with lib;

let
  cfg = config.within.git;
in
{
  options.within.git.enable = mkEnableOption "git config";

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "Faza Zikri";
          email = "fazadoang15@gmail.com";
        };
        url = {
          "git@github-personal:Blxckmage/".insteadOf = "git@github.com:Blxckmage/";
          "git@github-work:zetta-faza-ramadhan/".insteadOf = "git@github.com:zetta-faza-ramadhan/";
        };
      };

      includes = [
        {
          condition = "gitdir:/home/blackmage/Personal/";
          path = "/home/blackmage/.config/git/personal.gitconfig";
        }
        {
          condition = "gitdir:/home/blackmage/Work/";
          path = "/home/blackmage/.config/git/work.gitconfig";
        }
      ];
    };
  };
}
