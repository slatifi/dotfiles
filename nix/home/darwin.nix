{ pkgs, config, ... }: 
{
  programs.zsh.initContent = ''
    # secrets
    [ -f "$home/.secrets" ] && source "$home/.secrets"

    # brew setup
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # tmux-sessionizer
    bindkey -s ^f 'tmux-sessionizer\n'

    # nvm
    export nvm_dir="$home/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \
      source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

    export gpg_tty=$(tty)
    '';

  home.sessionVariables = {
    AWS_DEFAULT_REGION = "eu-west-2";
    PATH = builtins.concatStringsSep ":" [
      "/usr/local/texlive/2024/bin/universal-darwin"
      "$HOME/scripts"
      "$GOPATH/bin"
      "$HOME/.cargo/bin"
      "$(brew --prefix rustup)/bin"
      "$(brew --prefix postgresql@15)/bin"
      "$HOME/.local/share/pnpm"
      "$HOME/.local/bin"
      "/usr/local/bin"
      "/usr/bin"
      "/usr/sbin"
      "$PATH"
    ];
    DYLD_LIBRARY_PATH = "/usr/local/lib";
    XDG_CONFIG_HOME = "$HOME/.config";
    PNPM_HOME = "$HOME/.local/share/pnpm";
    TMPDIR = "/tmp";
    GOPATH = "$HOME/.local/opt/go";
    LIBRARY_PATH = builtins.concatStringsSep ":" [
      "/opt/homebrew/opt/libiconv/lib"
      "$LIBRARY_PATH"
    ];
  };

  programs.ssh.extraConfig = ''
    UseKeychain yes
  '';

  home.file = {
    ".hushlogin" = {
      text = "";
    };

    "Library/Application Support/tex-fmt/tex-fmt.toml" = {
      source = ../../latex/tex-fmt.toml;
    };
  };

  home.shellAliases = {
    reload-env = "unset __HM_SESS_VARS_SOURCED __HM_ZSH_SESS_VARS_SOURCED && source /etc/profiles/per-user/slatifi/etc/profile.d/hm-session-vars.sh && exec zsh -l";
  };
}
