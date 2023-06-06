#!/usr/bin/env bash

case $(uname | tr '[:upper:]' '[:lower:]') in
  linux*)
    export OS_NAME=linux
    ;;
  darwin*)
    export OS_NAME=osx
    ;;
  msys*)
    export OS_NAME=windows
    ;;
  *)
    export OS_NAME=notset
    ;;
esac

SCRIPT_DIRECTORY="$(dirname "$0")"

if [ "$OS_NAME" = "linux" ]; then
	sudo OS_NAME=$OS_NAME bash $SCRIPT_DIRECTORY/scripts/system.sh
else
	OS_NAME=$OS_NAME bash $SCRIPT_DIRECTORY/scripts/system.sh
fi

OS_NAME=$OS_NAME bash $SCRIPT_DIRECTORY/scripts/user.sh

echo -e "\nDone\n"
exit
