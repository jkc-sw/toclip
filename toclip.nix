{ lib, stdenv, xclip }:
stdenv.mkDerivation (finalAttrs:
{
  pname = finalAttrs.name;
  version = finalAttrs.version;

  src = "./";

  dontFixCmake = true;
  dontPatch = true;
  dontBuild = true;
  dontConfigure = true;
  dontFixup = true;

  installPhase = ''
    mkdir -p "$out/bin"
    cp ./toclip $out/bin/toclip
    cp ./toclipt $out/bin/toclipt
    substituteInPlace $out/bin/toclipt \
      --replace "/bin/bash" "${stdenv.shell}"
    substituteInPlace $out/bin/toclip \
      --replace "/bin/bash" "${stdenv.shell}"
  '';

  buildInputs = [ xclip ];

  meta = with lib; {
    description = "A simple bash script that copy text to local or remote clipboard from stdin or arguments.";
    homepage = "www.github.com/jkc-sw/toclip";
    mainProgram = "toclip";
    license = with licenses; [ mit ];
    platforms = platforms.unix;
  };
})

# vim:et ts=2 sts=2 sw=2

