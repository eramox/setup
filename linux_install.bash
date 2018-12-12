#!/bin/bash

list_apt_app=(
	"byobu"
	"htop"
)

help() {
	echo "HELP"

	return 1
}

update_apt() {
	sudo apt update
}

install_apt_bins() {
	local list_app=("${@:1}")
	local app

	update_apt

	for app in "${list_app[@]}"; do
		echo "Installing app [$app]"
		sudo apt install "$app"
		echo "  -> returns [$?]"
	done
}

main() {
	install_apt_bins "${list_apt_app[@]}"
}

main | help | exit 1

exit 0
