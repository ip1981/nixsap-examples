{ stdenv, bash, gawk, nix, makeWrapper }:

stdenv.mkDerivation {
  name = "whatsupnix";
  buildInputs = [ bash ];
  phases = [ "installPhase" ];
  nativeBuildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp -a ${./whatsupnix.bash} $out/bin/whatsupnix
    chmod +x $out/bin/whatsupnix
    patchShebangs $out/bin/whatsupnix
    wrapProgram "$out/bin/whatsupnix" \
      --prefix PATH : '${gawk}/bin:${nix}/bin'
  '';
}

