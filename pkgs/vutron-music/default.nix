{ sources, appimageTools, ... }:

let
  pname = sources.vutron-music.pname;
  version = sources.vutron-music.version;
  src = sources.vutron-music.src;
in
appimageTools.wrapType2 {
  inherit pname version src;
}