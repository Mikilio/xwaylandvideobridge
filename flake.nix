{
  description = "Utility to allow streaming Wayland windows to X applications";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, flake-utils, nixpkgs }:
    let

      pkgs = nixpkgs.legacyPackages.x86_64-linux;

    in rec {

      devShells.x86_64-linux.default = with pkgs;
        mkShell {
          buildInputs = [
            cmake
            extra-cmake-modules
            libsForQt5.qt5.wrapQtAppsHook
            libsForQt5.qt5.qtbase
            libsForQt5.qt5.qtdeclarative
            libsForQt5.qt5.qtx11extras
            libsForQt5.kpipewire
            libsForQt5.ki18n
            libsForQt5.knotifications
            libsForQt5.kwidgetsaddons
            libsForQt5.kwindowsystem
            xorg.libxcb
            pkg-config
          ];

          shellHook = ''
            export QT_QPA_PLATFORM_PLUGIN_PATH="${qt5.qtbase.bin}/lib/qt-${qt5.qtbase.version}/plugins/platforms";
          '';
        };
    };
}
