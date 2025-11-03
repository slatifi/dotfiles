{ pkgs, lib, config, ... }: 
{
  options = {
    darwin.user = lib.mkOption {
      type = lib.types.str;
      default = "slatifi";
      description = "The user to configure.";
    };
  };

  config = with config.darwin; {

    users.users.${user}.home = "/Users/${user}";

    system.defaults = {
      NSGlobalDomain._HIHideMenuBar = true;
      dock.autohide = true;
      spaces.spans-displays = false;
    };

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    # System packages
    environment.systemPackages = with pkgs; [
      bootdev-cli
      btop
      darwin.PowerManagement
      fd
      fzf
      gcc
      git
      htop
      lazygit
      libllvm
      lua-language-server
      nil
      prettierd
      ripgrep
      sshpass
      tmux
      tree
      uv
      vim
      wget
    ];

    fonts.packages = with pkgs; [
      fira-code
      jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.fira-code
    ];

    homebrew.enable = true;
    homebrew.onActivation.cleanup = "zap";

    homebrew.brews = [
      "autopep8"
      "awscli"
      "borders"
      "gh"
      "gnupg"
      "imagemagick"
      "iperf"
      "luarocks"
      "neovim"
      "node"
      "nvm"
      "pipx"
      "pkgconf"
      "pnpm"
      "pygments"
      "python@3.10"
      "python@3.12"
      "python@3.13"
      "python@3.9"
      "qmk/qmk/qmk"
      "rust"
      "scala"
      {
        name="sketchybar";
        start_service = true;
        restart_service = "changed";
      }
      "tfenv"
      "yarn"
      "zstd"
    ];

    homebrew.taps = [
      "homebrew/cask"
      "FelixKratz/formulae"
      "nikitabobko/tap"
      "qmk/qmk"
   ];

    homebrew.casks = [
      "aerospace"
      "arc"
      "bazecor"
      "displaylink"
      "font-sketchybar-app-font"
      "raycast"
    ];
  };
}
