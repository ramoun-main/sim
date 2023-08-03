#!/usr/bin/sh

SIM=~/.config/sim
export SIM

rm -rf $SIM

mkdir -p $SIM/share
mkdir -p $SIM/nvim

stow --restow --target=$SIM/nvim .

alias sim='XDG_DATA_HOME=$SIM/share XDG_CONFIG_HOME=$SIM nvim'

export sim

