let
  rust_overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
  rustVersion = "latest";
  rust = pkgs.rust-bin.stable.${rustVersion}.default.override {
    extensions = [
      "rust-src"
    ];
  };
  isDarwin = pkgs.stdenv.isDarwin;
in
pkgs.mkShell {
  buildInputs = (if isDarwin then [ pkgs.darwin.apple_sdk.frameworks.Security ] else [ ]) ++ [
    rust
  ] ++ (with pkgs; [
    clang
    openssl
    rustup
    rust-analyzer
    pkg-config
    postgresql
  ]);
  RUST_BACKTRACE = 1;
}