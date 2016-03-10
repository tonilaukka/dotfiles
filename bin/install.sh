#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY='tonilaukka/dotfiles'
declare -r DOTFILES='~/.dotfiles'

get_os() {
	declare -r OS_NAME="$(uname -s)"
	local os='' 

	if [ "$OS_NAME" == "Darwin" ]; then
		os='osx'	
	elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
		os='ubuntu'
	else
		os="$OS_NAME"	
	fi

	printf "%s" "$os"	

}

main() {
	declare -r OS="$(get_os)"

	if [ "$OS" == 'osx' ]; then
		printf "TODO: OS X"
	elif [ "$OS" == 'ubuntu' ]; then
		./ubuntu/install.sh
	else
		printf "$OS is not supported"
	fi
}

main
