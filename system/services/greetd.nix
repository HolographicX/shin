{
  config,
  pkgs,
  username,
  ...
}: {
  # greetd display manager

  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd ${config.programs.niri.package}/bin/niri-session";
        user = "greeter";
      };
      initial_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        user = username;
      };
    };
  };
}
