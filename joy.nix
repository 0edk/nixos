{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fastfetch
    (anki.withAddons [ (callPackage ./yukogurafu.nix {}) ])
    typst
    lynx
    libqalculate
  ];
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "edk";
    configDir = "/home/edk/.config/syncthing";
    settings = {
      devices = {
        "edge" = { id = "UDRQ52R-TFG6GYX-BEOU5UU-3CD5LV7-46WCWJT-57LAIRB-BY2P56D-4OP2DAU"; };
      };
      folders = {
        "targeted" = {
          path = "/home/edk/perennial/targeted_notes";
          devices = [ "edge" ];
        };
      };
    };
  };
}
