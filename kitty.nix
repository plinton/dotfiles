{ pkgs, ... }:
let
in
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "zsh";
    };
    extraConfig = builtins.readFile (pkgs.fetchFromGitHub
      {
        owner = "catppuccin";
        repo = "kitty";
        rev = "ad38e5bb1b1ab04e7d2cf86ded289c455df62908";
        sha256 = "0vb5fkpxjyyj180wfc948c1qvndlcwv0mzmz0xdv7wdg7qj9v7hk";
      } + "/mocha.conf");
  };
}
