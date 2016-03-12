#!/bin/bash

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

download() {

    local url="$1"
    local output="$2"

    if command -v 'curl' &> /dev/null; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

        return $?
    fi

    return 1
}

main() {
	
	declare -r OS="$(get_os)"

	if [ "$OS" == 'osx' ]; then
		./osx/install.sh
	elif [ "$OS" == 'ubuntu' ]; then
		./ubuntu/install.sh
	else
		printf "$OS is not currently supported"
	fi
}

main
