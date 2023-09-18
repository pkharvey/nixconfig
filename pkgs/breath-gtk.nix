{ pkgs }:
pkgs.stdenv.mkDerivation{
 name = "sddm-theme";
 src = pkgs.fetchFromGitLab {
  domain = "gitlab.manjaro.org";
  owner = "artwork/themes";
  repo = "breath-gtk";
  rev = "da2706640f457f89de6c26312e391b244ff550b4";
  sha256 = "sha256-hUOJCK7BlTVOK17ZpE6u4DQWQWCHXRXq4i7M8iycukE=";
 };
 installPhase = ''
 mkdir -p $out
 cp -R ./Breath/gtk-3.0/* $out/
 '';

}
