{ stdenv
, fetchFromGitHub
, autoreconfHook
, libtool
, popt
}:

stdenv.mkDerivation rec {
  pname = "picotts";
  version = "unstable-2019-09-12";

  src = fetchFromGitHub {
    owner = "naggety";
    repo = pname;
    rev = "e3ba46009ee868911fa0b53db672a55f9cc13b1c";
    sha256 = "0k3m7vh1ak9gmxd83x29cvhzfkybgz5hnlhd9xj19l1bjyx84s8v";
  };

  nativeBuildInputs = [ autoreconfHook ];

  buildInputs = [ libtool popt ];

  sourceRoot = "source/pico";

  meta = with stdenv.lib; {
    description = "Text to speech voice sinthesizer from SVox";
    homepage = "https://github.com/naggety/picotts";
    license = licenses.asl20;
    maintainers = with maintainers; [ canndrew ];
    platforms = platforms.linux;
  };
}
