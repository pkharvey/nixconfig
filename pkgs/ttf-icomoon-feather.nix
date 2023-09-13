{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "icomoon_feather_ttf";
  version = "1.10";

  src = fetchurl {
    url = "https://github.com/khanhas/dotfiles/raw/master/polybar/fonts/icomoon-feather.ttf";
    hash = "";
  };

  installPhase = ''
    runHook preInstall

    install -m444 -Dt $out/share/fonts/truetype *.ttf

    runHook postInstall
  '';

  meta = { };
}