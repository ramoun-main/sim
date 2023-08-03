#!/usr/bin/sh

SIM=~/.config/sim
export SIM

alias sim='XDG_DATA_HOME=$SIM/share XDG_CONFIG_HOME=$SIM nvim'
export sim

sim

