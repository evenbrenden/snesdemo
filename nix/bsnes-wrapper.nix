{ pkgs }:

pkgs.writeScriptBin "bsnes-wrapper" ''
  #! /usr/bin/env bash

  if [ "$#" -eq 0 ]; then
      echo "bsnes-mercury-performance [retroarch arguments]"
  fi

  ${pkgs.retroarchBare}/bin/retroarch \
      --appendconfig ${./retroarch.cfg} \
      --libretro ${pkgs.libretro.bsnes-mercury-performance}/lib/retroarch/cores/bsnes_mercury_performance_libretro.so \
      "$@"
''
