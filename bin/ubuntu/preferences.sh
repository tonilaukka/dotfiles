#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
	&& source '../utils.sh'

declare -r REPEAT_INTERVAL='25'
declare -r DELAY='400'

set_preferences() {
	execute "gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval $1 && 
		 gsettings set org.gnome.desktop.peripherals.keyboard delay $2" \
		"Changed keyboard repeat-interval to $REPEAT_INTERVAL ms and delay to $DELAY ms"	
}

main() {

	print_in_purple '\n Ubuntu preferences\n'
	set_preferences $REPEAT_INTERVAL $DELAY

}

main
