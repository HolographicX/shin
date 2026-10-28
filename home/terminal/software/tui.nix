{
  inputs,
  pkgs,
  username,
  ...
}: {
  users.users.${username}.packages = with pkgs;
    [
      # archives
      zip
      unzip
      unrar
      ouch

      # misc
      libnotify
      fontconfig
      fastfetch

      # utils
      dust
      duf
      fd
      file
      killall
      jq
      ps_mem

      gtt
      meteor-git
      nix-search-tv
      opencode
      antigravity-cli
    ]
    ++ (with inputs.mynixpkgs.packages.${stdenv.hostPlatform.system}; [
      nekot
      omm
      prs
    ]);
}
