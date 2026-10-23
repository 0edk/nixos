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
  };
}
