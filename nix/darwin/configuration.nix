{ self, pkgs, config, ... }: {
      nixpkgs.config.allowUnfree = true;

      programs.zsh.enable = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        with pkgs; [
          mkalias

          # Apps
          raycast
          aldente
        ];

      homebrew = {
        enable = true;
        casks = [
          "hammerspoon"
          "1password"
          "signal"
          "tomatobar"
          "protonvpn"
          "zen-browser"
          "anki"
          "docker"
          "zulip"
          "intellij-idea"
        ];
        masApps = {
          "WhatsApp" = 310633997;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
            '';

      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
          "/Applications/Zen Browser.app"
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleICUForce24HourTime = false;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      nix = {
        package = pkgs.nix;
        gc.automatic = true;
        optimise.automatic = true;
        settings = {
          auto-optimise-store = true;
          experimental-features = [ "nix-command" "flakes"];
        };
      };

      users.users.andrii = {
	name = "andrii";
	home = "/Users/andrii";
        shell = pkgs.zsh;
      };

      environment.shells = [ pkgs.zsh ];

      security.pam.enableSudoTouchIdAuth = true;
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;


      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    }
