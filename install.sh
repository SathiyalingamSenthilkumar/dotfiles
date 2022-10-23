#!/usr/bin/env zsh

symlinker() {
  SRC_PATH="$1"
  DST_PATH="$2"

  if [ -e "${DST_PATH}" ]; then
    echo "${DST_PATH} already exists"
  else
    echo "${SRC_PATH} -> ${DST_PATH}"
    mkdir -p "$(dirname "${DST_PATH}")"
    ln -s "${SRC_PATH}" "${DST_PATH}"
  fi
}

DOTFILES_DIR="$(cd "$(dirname "${0}")" && pwd -P)"
TARGET=${1}

PLATFORM=$(uname -s)

CONFIG_SRC="${DOTFILES_DIR}/config"
CONFIG_DST="${HOME}/.config"

LOCAL_BIN_SRC="${DOTFILES_DIR}/local/bin"
LOCAL_BIN_DST="${HOME}/.local/bin"

LINUX_FONT_SRC="${DOTFILES_DIR}/local/share/fonts"
LINUX_FONT_DST="${HOME}/.local/share/fonts"

# Find all direcories in config/
CONFIG_NAMES=()
for d in ${CONFIG_SRC}/*/; do
  CONFIG_NAMES+=("$(basename "${d}")")
done

# Find all files in local/bin/
LOCAL_BIN_NAMES=()
for f in ${LOCAL_BIN_SRC}/*; do
  LOCAL_BIN_NAMES+=("$(basename "${f}")")
done

# Find fonts
LINUX_FONT_NAMES=()
for f in ${DOTFILES_DIR}/local/share/fonts/*; do
  LINUX_FONT_NAMES+=("$(basename "${f}")")
done

# Platform-specific stuff
case ${PLATFORM} in
  Linux)
    for f in "${LINUX_FONT_NAMES[@]}"; do
      symlinker "${LINUX_FONT_SRC}/${f}" "${LINUX_FONT_DST}/${f}"
    done
    fc-cache -f &
    ;;

  Darwin)
    ;;

  FreeBSD)
    ;;

  *)
    echo "Unknown platform, bailing out"
    exit -1
    ;;
esac

# Setup .config directory
for d in ${CONFIG_NAMES[@]}; do
  symlinker "${CONFIG_SRC}/${d}" "${CONFIG_DST}/${d}"
done

# Setup .local/bin directory
for f in ${LOCAL_BIN_NAMES[@]}; do
  symlinker "${LOCAL_BIN_SRC}/${f}" "${LOCAL_BIN_DST}/${f}"
done
