{ pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        with pkgs; [
          iina
        ];

      programs.fish.enable = true;
      programs.fish.vendor = {
        config.enable = true;
        functions.enable = true;
        completions.enable = true;
      };

      homebrew = {
        enable = true;
        brews = [
          "zig"
        ];
        casks = [
          "anki"
          "1password"
          "hammerspoon"
          "protonvpn"
          "zen-browser"
          "intellij-idea"
          "raycast"
          "tomatobar"
          "ghostty"
          "rectangle"
        ];
        masApps = {
          "WhatsApp" = 310633997;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };


      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
          "/Applications/Zen Browser.app"
          "/Applications/Ghostty.app"
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

      nix = {
        package = pkgs.nix;
        gc.automatic = true;
        optimise.automatic = true;
        settings = {
          experimental-features = [ "nix-command" "flakes"];
        };
      };

      users.users.andrii = {
        name = "andrii";
        home = "/Users/andrii";
      };

      environment.shells = [ pkgs.fish ];

      security.pam.enableSudoTouchIdAuth = true;
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;


      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    }
