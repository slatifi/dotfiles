{ pkgs, config, user, homeStructure, ... }: 
let 
  homeDir = "${homeStructure}/${user}";
in {
  # Home Manager configuration
  home.stateVersion = "24.11";
  
  home.username = user;
  home.homeDirectory = homeDir;

  programs.home-manager.enable = true;

  # Add dotfiles
  home.file = {
    ".config/tmux/tmux.conf" = {
      source = ../../tmux/tmux.conf;
    };

    ".config/tmux/tmux.reset.conf" = {
      source = ../../tmux/tmux.reset.conf;
    };

    ".config/aerospace/aerospace.toml" = {
      source = ../../aerospace/aerospace.toml;
    };

    ".config/sketchybar" = {
      source = ../../sketchybar;
      recursive = true;
    };

    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/git/nvim-config";
    };

    ".secrets" = {
      source = config.lib.file.mkOutOfStoreSymlink "${homeDir}/git/dotfiles/.secrets";
    };

    "scripts" = {
      source = ../../scripts;
      recursive = true;
    };

    ".hushlogin" = {
      text = "";
    };
  };


  # ZSH configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  home.shellAliases = {
    ssh = "kitten ssh";
    git_conflicts = "git ls-files -u | cut -f 2 | sort -u";
    vim = "nvim";
    create-notebook = "python3 ~/scripts/create-notebook.py";
    fcd = ''cd "$(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv | fzf)"'';
    venva = "source venv/bin/activate";
    lg = "lazygit";
    drb= "sudo darwin-rebuild switch --flake ~/git/dotfiles/nix#";
    srb= "sudo nixos-rebuild switch --flake ~/git/dotfiles/nix#";
    ls = "ls --color=auto";
    ll = "ls -alh";
    p = "python3";
    n = "pnpm";
  };

  programs.git = {
    enable = true;
    userName= "Saif Latifi";
    userEmail = "saif.latifi@gmail.com";
    signing = {
      key = "2203751A68F82567";
      signByDefault = true;
    }; 
    extraConfig.init.defaultBranch = "main";
    extraConfig.core.editor = "vim";
  };

  # Kitty configuration
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    font.name = "Fira Code";
    keybindings = {
      "§" = "send_text all #";
      "cmd+k" = "send_text all \\x0c";
    };
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      macos_option_as_alt = "yes";
      confirm_os_window_close = 0;
      wayland_titlebar_color = "#1E1E2E";
      macos_titlebar_color = "#1E1E2E";
    };
  };

  # SSH configuration
  programs.ssh = {
    enable = true;
    includes = ["${homeDir}/.ssh/extra_config"];
    addKeysToAgent = "yes";
  };
}
