#!/usr/bin/env sh

current=`pwd`

fish_shell=`/usr/bin/env which fish`

sword_root="$HOME/.sword"

sword_git="https://github.com/tmaone/sword-fish.git"

os=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`

if [ ! -z "$fish_shell" ]; then
  echo "Using: [$fish_shell]"
else
  echo "fish-shell is not installed!";
  case "$os" in
      darwin)
        # echo "Darwin";
        if [ -e "/usr/local/bin/brew" ]; then
          echo "You can install [fish-shell] using [homebrew] with:\n\n  brew install fish --HEAD\n"
        fi
        if [ -e "/opt/local/bin/port" ]; then
          echo "You can install [fish-shell] using [macports] with:\n\n  port install fish\n"
        fi
        ;;
      linux)
        echo "Linux";
        echo "You need to install [fish-shell] using your package manager\n"
        ;;
      *)
        echo "Uknown";
        echo "You need to install [fish-shell] using your package manager\n"
        ;;
  esac
  exit 1;
fi
