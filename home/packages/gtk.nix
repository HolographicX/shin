{pkgs, username, ...}: {
  users.users.${username}.packages = with pkgs; [
    bibata-cursors
    (whitesur-icon-theme.override {
      boldPanelIcons = true;
      alternativeIcons = true;
    })
    gsettings-desktop-schemas
    xdg-user-dirs
    adw-gtk3
  ];

  environment.sessionVariables = {
    XDG_ICON_DIR = "${pkgs.whitesur-icon-theme}/share/icons/WhiteSur";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    XCURSOR_THEME = "Bibata-Original-Ice";
    XCURSOR_SIZE = "20";
    QS_ICON_THEME = "MacTahoe-dark";
  };

  xdg.configFile."gtk-3.0/bookmarks" = {
    mutable = true;
    text = ''
      file:///home/${username}/Downloads Downloads
      file:///home/${username}/Documents Documents
      file:///home/${username}/Music Music
      file:///home/${username}/Pictures Pictures
      file:///home/${username}/Videos Videos
    '';
  };
}
