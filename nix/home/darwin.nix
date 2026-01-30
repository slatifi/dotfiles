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
      "/Library/Frameworks/Python.framework/Versions/2.7/bin"
      "$HOME/Library/Python/3.9/bin"
      "$HOME/scripts"
      "$HOME/.local/share/pnpm"
      "$HOME/.local/bin"
      "/usr/local/bin"
      "/opt/local/bin"
      "/opt/local/sbin"
      "/usr/sbin"
      "$PATH"
    ];
    DYLD_LIBRARY_PATH = "/usr/local/lib";
    XDG_CONFIG_HOME = "$HOME/.config";
    PNPM_HOME = "$HOME/.local/share/pnpm";
    TMPDIR = "/tmp";
  };

  programs.ssh.extraConfig = ''
    UseKeychain yes
  '';
}
