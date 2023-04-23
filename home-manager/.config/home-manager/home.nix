{ pkgs, lib, config, ... }:
let
  inherit (pkgs) stdenv;
  inherit (lib) mkIf;

  # verifica si estamos en macOS
  onMac = stdenv.isDarwin;

  # verifica si `yay` esta instalado y existe en PATH
  hasYay = pkgs.runCommand "yay-in-path" { } "command -v yay > /dev/null" == 0;

  # verifica si `asdf` existe en la carpeta del usuario
  hasAsdfvm = builtins.pathExists "${config.home.homeDirectory}/.asdf/bin/asdf";

  # obtiene el nombre del host
  hostname = builtins.getEnv "HOSTNAME";

  # revisa si estamos usando la compu del trabajo XD
  atWork = lib.strings.hasInfix "CR-400" hostname;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jorge";
  home.homeDirectory =
    if (stdenv.isDarwin) then "/Users/jorge" else "/home/jorge";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;
    [
      # fuentes
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      mplus-outline-fonts.githubRelease
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Iosevka" ]; })
      iosevka
      iosevka-comfy.comfy
      iosevka-comfy.comfy-motion-duo
      fira
      fira-code

      #  aplicaciones gráficas, con soporte multi-sistema
      slack
      discord

      # linea de comandos
      xcp
      ripgrep
      thefuck
      tree
      fd
      jq
      d2

      # git
      git-crypt

      # dependencias de Emacs
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.es
      ccls
      nixfmt
      shellcheck

      # dependencias de Doom Emacs
      python311Packages.grip
      rust-analyzer
      plantuml
      html-tidy
      nodePackages_latest.stylelint
      nodePackages_latest.js-beautify
      nodePackages.prettier
    ] ++ lib.optionals stdenv.isLinux [
      # aplicaciones gráficas
      notion-app-enhanced
      spotify
      todoist-electron
      signal-desktop-beta
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "zellij-layouts-41" = {
      enable = true;
      target = ".config/zellij/layouts/41.kdl";
      text = ''
        layout {
               pane size=1 borderless=true {
                    plugin location="zellij:compact-bar"
               }
               pane split_direction="horizontal" {
                    pane split_direction="vertical" {
                         pane name="main"
                         pane split_direction="horizontal" {
                              pane name="aux. alpha"
                              pane name="aux. bravo"
                              pane name="aux. charlie"
                         }
                    }
                    pane size="20%" name="command-line" focus=true
               }
               pane size=2 borderless=true {
                    plugin location="zellij:status-bar"
               }
        }
      '';
    };
  };

  home.sessionVariables = {
    EDITOR = "emacs";
    ASDF_DIR = "$HOME/.asdf";
  };

  fonts.fontconfig.enable = true;

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = true;

      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol = "[💀](bold red) ";
      };
    };
  };

  programs.zsh = {
    enable = true;
    initExtra = ''
      . "''${ASDF_DIR}/asdf.sh";
      if [ -f "/opt/homebrew/bin/brew" ]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      if [ -f "$HOME/.emacs.d/bin/doom" ]; then
         export PATH="$PATH:$HOME/.emacs.d/bin"
      elif [ -f "$HOME/.config/emacs/bin/doom" ]; then
         export PATH="$PATH:$HOME/.config/emacs/bin"
      fi
    '';
    history = {
      size = 10000;
      save = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignorePatterns = [ "rm *" "pkill *" "killall *" "cd *" "mv *" ];
      ignoreSpace = true;
    };
    shellAliases = {
      ip = "ip --color=auto";
      cp = "xcp";
      mv = "mv -i";
      rm = " rm -v";
      ln = "ln -i";
      chown = "chown --preserve-root";
      chmod = "chmod --preserve-root";
      chgrp = "chgrp --preserve-root";
      cls = ''
        echo -ne "\033c"
      '';

    } // lib.optionalAttrs (hasYay && hasAsdfvm) {
      yay = ''
        env PATH="''${PATH//~\/.asdf\/shims:/}" yay
      '';
    };

    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dirHashes = {
      dev = "$HOME/code";
      gamedev = "$HOME/sotsfgs/proyectos";
      tmp = "/tmp";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "marlonrichert/zsh-autocomplete"; }
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions =
      [ "--height 40%" "--layout=reverse" "--border" "--inline-info" ];
  };

  programs.bat = {
    enable = true;
    config = { tabs = "8"; };
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userEmail = "jorge@esavara.cr";
    userName = "Jorge Javier Araya Navarro";
    signing = mkIf (!atWork) {
      key = "F15FE636C8AEC2D9";
      signByDefault = false;
    };

    extraConfig = {
      core = { whitespace = "trailing-space,space-before-tab"; };
      color = { ui = "auto"; };
      rerere = { enabled = "true"; };
      rebase = { autoSquash = "true"; };
      github = { user = "shackra"; };
      init.defaultBranch = "master"; # a classic
      url = mkIf atWork {
        "ssh://git@github.com/" = { insteadOf = "https://github.com/"; };
      };
    };

    lfs = { enable = true; };

    ignores = [
      "*~"
      "*.swp"
      ".ccls-cache"
      "compile_commands.json"
      "shell.nix"
      ".tool-versions"
      ".DS_Store"
    ];
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
    icons = true;
    extraOptions = [ "--group-directories-first" "--header" ];
    git = true;
  };

  services.gpg-agent = {
    enable = stdenv.isLinux;

    defaultCacheTtl = 86400;
    defaultCacheTtlSsh = 86400;
    maxCacheTtl = 86400;
    maxCacheTtlSsh = 86400;
    enableSshSupport = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
