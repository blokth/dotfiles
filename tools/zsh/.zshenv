#!/usr/bin/env bash

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_LIB_HOME="${XDG_LIB_HOME:-$HOME/.local/lib}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

export EDITOR="vim"
export LANG="en_US.UTF-8"
export TERM="screen-256color"

export CABAL_CONFIG="${XDG_CONFIG_HOME}/cabal/config"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GHCUP_USE_XDG_DIRS="true"
export CURL_HOME="${XDG_CONFIG_HOME}/curl"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep/config"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZLIB="${ZDOTDIR}/lib"

export TELEMETRY_DISABLED=1
