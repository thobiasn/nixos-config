{ stdenv, fetchurl, lib }:

stdenv.mkDerivation rec {
  pname = "flyctl";
  version = "0.2.65"; # Or whatever the latest version is

  src = fetchurl {
    url = "https://github.com/superfly/flyctl/releases/download/v${version}/flyctl_${version}_Linux_x86_64.tar.gz";
    sha256 = "0hpb29f9vlspq0dqksgickpdmqrq6m4l8rmm9sa35b760ls30a1b";
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
