{ pkgs, ... }:

{
  # Packages with configuration ---------------------------------------------------------------
  home.packages = with pkgs; [
    ##################################
    # common
    ##################################
    tealdeer
    fastfetch
    zip
    xz
    unzip
    p7zip
    ripgrep
    jq
    eza
    cowsay
    file
    which
    tree

    ##################################
    # Shell / Zsh plugins (packaged)
    ##################################
    zsh-fzf-tab
    zsh-you-should-use

    ##################################
    # Nix / System
    ##################################
    btop
    lsof
    wl-clipboard

    ##################################
    # Productivity
    ##################################
    bat
    fd
    fzf
    httpie
    yazi
    zellij
    neovim
    lazygit
    mise
    gh

    ##################################
    # Development
    ##################################
    cargo
    rustc
    bun
    pnpm
    luarocks
    luajitPackages.luacheck
    lua-language-server
    tree-sitter
    eslint
    prettier
    mongodb-ce
    mongosh

    ##################################
    # Misc / UI
    ##################################
    starship
    mcp-nixos
    fontforge
  ];
}
