#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
	&& source '../utils.sh'

set_preferences() {
	execute 'gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25 && 
		 gsettings set org.gnome.desktop.peripherals.keyboard delay 400' \
		'Change keyboard repeat-interval and delay'	
}

main() {

	print_in_purple '\n Ubuntu preferences\n'
	set_preferences

}

main
