{ pkgs ? import <nixpkgs> {}, unstable ? import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { } }:

pkgs.mkShell {
  buildInputs = with unstable; [
    go
    google-cloud-sdk
    bashInteractive
    gcc
    rsync
    jq
    etcd
  ];
}