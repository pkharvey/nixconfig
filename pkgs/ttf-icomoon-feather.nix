
{ lib, fetchurl, stdenv }:

let
 pname = "icomoon_feather_ttf";
 version = "1.10";
  # There are slashed variants, but with same name so only bundle the default versions for now:
  font = 
    fetchurl {
       url = "https://github.com/khanhas/dotfiles/raw/master/polybar/fonts/icomoon-feather.ttf";
       sha256 = "sha256-103CIqDuBOvSoWn+2OtDdpKpiDPAZTT1RQQA/QJKm7s=";
       name = "icomoon-feather.ttf";
  };
  

in stdenv.mkDerivation {
  inherit pname version;
  srcs = font;
  sourceRoot = ".";

  dontUnpack = true;

  installPhase = ''
    install -D $srcs -t $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "icomoon feather icons";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
