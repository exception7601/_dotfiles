{ pkgs ? import <nixpkgs> {} }:

with pkgs; [
  neovim
  git
]
