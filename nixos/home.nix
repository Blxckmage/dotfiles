{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/gpg.nix
    ./modules/git.nix
    ./modules/packages.nix
  ];

  within.gpg.enable = true;
  within.git.enable = true;

  home.username = "blackmage";
  home.homeDirectory = "/home/blackmage";

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = lib.mkAfter ''
      eval "$(mise activate zsh)"
      export PATH="/home/blackmage/.bun/bin:$PATH"
      [[ -f ~/.config/zsh/shell ]] && source ~/.config/zsh/shell
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
      # re-source syntax highlighting last (must be after fzf-tab)
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      [[ -f ~/.config/zsh/init ]] && source ~/.config/zsh/init
      [[ -f ~/.config/zsh/aliases ]] && source ~/.config/zsh/aliases
      [[ -f ~/.config/zsh/prompt ]] && source ~/.config/zsh/prompt
      [[ -f ~/.config/zsh/envs ]] && source ~/.config/zsh/envs
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidget.zsh.command = "";
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
  };

  programs.tmux = {
    enable = true;
    shortcut = "a";
    newSession = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = tmux-sessionx;
        extraConfig = ''
          set-environment -gu TMUX_PLUGIN_MANAGER_PATH
        '';
      }
    ];
    extraConfig = ''
      source-file /home/blackmage/.dotfiles/.config/tmux/tmux.conf
      set-environment -gu TMUX_PLUGIN_MANAGER_PATH
    ''; # ponytail: unset after dotfile re-sets it (fixes sessionx #132)
  };

  xdg.configFile = lib.genAttrs [ "nvim" "yazi" "starship" "zsh" ] (n: {
    source = config.lib.file.mkOutOfStoreSymlink "/home/blackmage/.dotfiles/.config/${n}";
  });

  home.stateVersion = "26.05";
}
