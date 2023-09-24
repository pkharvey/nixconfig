 { pkgs }:

let
  imgLink = "https://gitlab.manjaro.org/artwork/themes/breath/-/blob/master/wallpapers/North/contents/images/5120x2880.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-SJ4orUz2dYl2UkNv0nb3b7A41UXTmOT5JwGzZPMPoUQ=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
