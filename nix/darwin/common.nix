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
      btop
      circumflex
      # darwin.PowerManagement
      fd
      fzf
      gcc
      git
      go
      htop
      lazygit
      libllvm
      lua-language-server
      nil
      prettierd
      ripgrep
      sqlc
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
      "cocoapods"
      "gh"
      "ghc"
      "gnupg"
      "imagemagick"
      "iperf"
      "just"
      "latexdiff"
      "libiconv"
      "lld"
      "llvm"
      "luarocks"
      "mariadb"
      "neovim"
      "nvm"
      "pipx"
      "pkgconf"
      "pnpm"
      "postgresql@15"
      "pygments"
      "python@3.10"
      "python@3.12"
      "python@3.13"
      "python@3.9"
      "rclone"
      "rustup"
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

    homebrew.taps = map (tapName: { name = tapName; trusted = true; }) [
      "homebrew/cask"
      "FelixKratz/formulae"
      "nikitabobko/tap"
   ];

    homebrew.casks = [
      "aerospace"
      "arc"
      "bazecor"
      "camunda-modeler"
      "cyberduck"
      "datagrip"
      "displaylink"
      "font-sketchybar-app-font"
      "raycast"
      "skim"
      "tunnelblick"
    ];
  };
}
