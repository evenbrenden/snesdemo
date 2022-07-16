{ stdenv, fetchFromGitHub, cmake, alsa-lib, SDL2 }:

stdenv.mkDerivation rec {
  pname = "ft2-clone";
  version = "1.50";

  src = fetchFromGitHub {
    owner = "8bitbubsy";
    repo = "ft2-clone";
    rev = "v${version}";
    sha256 = "sha256-OURD8k8DIa1DddDng55HrzgAN95srW4wm7RD7DbiJLQ=";
  };

  patches = [ ./0001-Read-and-write-note-volume-in-the-00-64-range.patch ];

  nativeBuildInputs = [ cmake ];

  buildInputs = [ alsa-lib SDL2 ];
}
