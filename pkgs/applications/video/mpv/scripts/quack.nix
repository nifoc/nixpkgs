{
  lib,
  fetchFromGitHub,
  unstableGitUpdater,
  buildLua,
}:

buildLua {
  pname = "mpv-quack";

  version = "0-unstable-2020-05-27";
  src = fetchFromGitHub {
    owner = "CounterPillow";
    repo = "mpv-quack";
    rev = "1c87f36f9726d462dd112188c04be54d85692cf3";
    hash = "sha256-dEnJbS8RJoAxpKINdoMHN4l7vpEdf7+C5JVWpK0VXMw=";
  };
  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Reduce audio volume after seeking";
    longDescription = ''
      quack is an mpv script to temporarily reduce the volume after a seek,
      in order to avoid loud noises when scrubbing through a movie.

      The volume is linearly increased back up to its original level.
      Repeated seeks before the transition is done work as well.
    '';
    homepage = "https://github.com/CounterPillow/mpv-quack";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ nicoo ];
  };
}
