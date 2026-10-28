{pkgs, ...}: {
  services = {
    # needed for GNOME services outside of GNOME Desktop
    dbus = {
      implementation = "broker";
      packages = with pkgs; [
        gnome-settings-daemon
        libsecret
      ];
    };
    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;
  };
}
