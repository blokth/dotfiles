{
  pkgs,
  inputs,
  config,
  platform,
  hostname,
  username,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    iina
  ];

  environment.variables = {
    EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    VISUAL = "nvim";
    PATH = "${config.environment.systemPath}:/opt/ST/STM32CubeCLT_1.18.0/STM32CubeProgrammer/bin";
  };

  nix = {
    package = pkgs.nix;
    gc.automatic = true;
    optimise.automatic = true;
    settings.experimental-features = "nix-command flakes";
  };

  system.primaryUser = "andrii";

  networking.hostName = hostname;
  networking.applicationFirewall.enable = true;
  networking.applicationFirewall.blockAllIncoming = true;

  documentation.enable = true;
  documentation.doc.enable = true;
  documentation.info.enable = true;
  documentation.man.enable = true;

  programs.info.enable = true;
  programs.fish = {
    enable = true;
    vendor = {
      config.enable = true;
      functions.enable = true;
      completions.enable = true;
    };
    shellAliases = {
      cat = "bat";
      cd = "z";
      find = "fd";
      ls = "eza -1 --color=auto";
      ll = "eza -1l --color=auto";
    };

    shellInit = ''
      function fish_greeting
      end

      set SYSTEMC_HOME /opt/homebrew/opt/systemc
      set GTEST_HOME /opt/homebrew/opt/googletest
      set -gx PATH /opt/ST/STM32CubeCLT_1.18.0/STM32CubeProgrammer/bin $PATH

      zoxide init fish | source
    '';
  };
  homebrew = {
    enable = true;
    brews = [
      "googletest"
      "systemc"
    ];
    casks = [
      "anki"
      "1password"
      "protonvpn"
      "zen"
      "intellij-idea"
      "raycast"
      "rectangle"
      "signal"
      "zoom"
      "spotify"
      "telegram"
      "ghostty"
      "docker"
      "inkscape"
      "calibre"
      "mattermost"
    ];
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock.autohide = true;
    dock.persistent-apps = [
      "/Applications/Zen Browser.app"
      "/Applications/Ghostty.app"
    ];
    dock.largesize = 64;
    dock.magnification = true;
    dock.show-recents = false;
    dock.static-only = true;
    dock.tilesize = 16;
    dock.wvous-br-corner = 1;
    loginwindow.GuestEnabled = false;
    finder.AppleShowAllFiles = true;
    finder.AppleShowAllExtensions = true;
    finder.CreateDesktop = true;
    finder.FXEnableExtensionChangeWarning = false;
    finder.FXPreferredViewStyle = "clmv";
    finder.FXRemoveOldTrashItems = true;
    finder.NewWindowTarget = "Home";
    finder.ShowExternalHardDrivesOnDesktop = true;
    finder.ShowMountedServersOnDesktop = true;
    finder.ShowRemovableMediaOnDesktop = true;
    finder.ShowStatusBar = true;
    finder._FXShowPosixPathInTitle = true;
    finder._FXSortFoldersFirst = true;
    hitoolbox.AppleFnUsageType = "Change Input Source";
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticInlinePredictionEnabled = false;
    NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
    NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
    NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
    NSGlobalDomain.NSDisableAutomaticTermination = true;
    NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
    NSGlobalDomain.KeyRepeat = 5;
    NSGlobalDomain.InitialKeyRepeat = 10;
    NSGlobalDomain.AppleTemperatureUnit = "Celsius";
    NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
    NSGlobalDomain.AppleShowAllFiles = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleScrollerPagingBehavior = true;
    NSGlobalDomain.AppleMetricUnits = 1;
    NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
    NSGlobalDomain.AppleFontSmoothing = 2;
    LaunchServices.LSQuarantine = false;
    ".GlobalPreferences"."com.apple.mouse.scaling" = 2.0;
    NSGlobalDomain.NSWindowResizeTime = 0.1;
    NSGlobalDomain._HIHideMenuBar = true;
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
    NSGlobalDomain."com.apple.swipescrolldirection" = false;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    controlcenter.BatteryShowPercentage = false;
    controlcenter.Bluetooth = false;
    controlcenter.Display = false;
    controlcenter.FocusModes = false;
    controlcenter.NowPlaying = false;
    controlcenter.Sound = false;
    menuExtraClock.Show24Hour = true;
    menuExtraClock.ShowDate = 1;
    menuExtraClock.ShowDayOfMonth = true;
    menuExtraClock.ShowDayOfWeek = false;
    menuExtraClock.ShowSeconds = true;
    trackpad.ActuationStrength = 0;
    trackpad.Clicking = true;
  };

  users.users.andrii = {
    name = "${username}";
    home = "/Users/${username}";
  };

  environment.shells = [pkgs.fish];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  nixpkgs.hostPlatform = lib.mkDefault "${platform}";
}
