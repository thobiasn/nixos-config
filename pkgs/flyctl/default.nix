{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "flyctl";
  version = "0.3.105";

  src = fetchurl {
    url = "https://github.com/superfly/flyctl/releases/download/v${version}/flyctl_${version}_Linux_x86_64.tar.gz";
    sha256 = "sha256-VrULMXutxPI95Sr67HD3Y1yfPLSSDa/4fKRCH/VWUt0=";
  };

  unpackPhase = ''
    mkdir source
    tar -xzf $src -C source
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp source/flyctl $out/bin/flyctl
    chmod +x $out/bin/flyctl
  '';

  meta = with lib; {
    description = "Fly.io CLI – prebuilt binary";
    homepage = "https://fly.io/docs/flyctl/";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
