{ pkgs ? import <nixpkgs> {}, ghc ? pkgs.ghc }:

pkgs.haskell.lib.buildStackProject {
  name = "hsroots";
  inherit ghc;
  buildInputs = with pkgs; [
                             libinput
                             # (callPackage ./nix/libinput/default.nix { } )
                             (callPackage ./nix/wayland.nix { } )
                             (callPackage ./nix/wayland-protocols.nix { } )
                             (callPackage ./nix/wlroots.nix { } )
                             libGL
                             xorg.pixman
                             libxkbcommon
                             zlib
                             git
                             xorg.libX11
                             udev
                             cabal-install
                             pkgconfig
                             pixman
                             (callPackage ./nix/libdrm.nix { } )
                          ];

  LANG = "en_US.UTF-8";
  TMPDIR = "/tmp";
}
