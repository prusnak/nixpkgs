{ stdenv, lib, fetchurl, ncurses5, python27 }:

with lib;

stdenv.mkDerivation rec {
  name = "gcc-arm-embedded-${version}";
  version = "7-2018-q2-update";
  subdir = "7-2018q2";

  urlString = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/${subdir}/gcc-arm-none-eabi-${version}-linux.tar.bz2";

  src = fetchurl { url=urlString; sha256="0sgysp3hfpgrkcbfiwkp0a7ymqs02khfbrjabm52b5z61sgi05xv"; };

  installPhase = ''
    mkdir -p $out
    cp -r * $out
  '';

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ stdenv.cc.cc ncurses5 python27 ];

  meta = {
    description = "Pre-built GNU toolchain from ARM Cortex-M & Cortex-R processors (Cortex-M0/M0+/M3/M4/M7, Cortex-R4/R5/R7/R8)";
    homepage = https://developer.arm.com/open-source/gnu-toolchain/gnu-rm;
    license = with licenses; [ bsd2 gpl2 gpl3 lgpl21 lgpl3 mit ];
    maintainers = with maintainers; [ prusnak ];
    platforms = platforms.linux;
  };
}
