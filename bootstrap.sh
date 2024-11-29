#!/bin/bash
set -euo pipefail

CONF_FOLDER="$HOME/.config"
DATA_FOLDER="$(pwd)/data"

link_folder() {
  for entry in ${DATA_FOLDER}${1}/*; do
    filename=$(basename $entry)

    if [ -d $entry ]; then
      echo "  $1/$filename"
      link_folder "$1/$filename"
    else
      echo "    $filename"
      ln -sf "$DATA_FOLDER$1/$filename" "$CONF_FOLDER$1/$filename"
    fi
  done
}

echo "Linking files to: $CONF_FOLDER"
link_folder ""
echo "Success!"
