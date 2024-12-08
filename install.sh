#!/usr/bin/env bash

set -ue

function helpmsg() {
	print_default "Usage: ${BASH_SOURCE[0]:-$0} [--help | -h]" 0>&2
	print_default ""
}

function main() {
	local current_dir
	current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
	source "${current_dir}"/script/dotinstaller/lib/utilfuncs.sh

	local install
	install="true"

	while [ $# -gt 0 ]; do
		case ${1} in
			--debug | -d)
				set -uex
				;;
			--help | -h)
				helpmsg
				exit 1
				;;
			install)
				install="true"
				;;
			*) ;;

		esac
		shift
	done

	if [[ "$install" = true ]]; then
		if yes_or_no_select "Are you ready for starting install?"; then
			"${current_dir}"/script/dotinstaller/dotinstall.sh install
			print_info ""
			print_info "#####################################################"
			print_info "$(basename "${BASH_SOURCE[0]:-$0}") install finish!!!"
			print_info "#####################################################"
			print_info ""
		fi
	fi
	
}

main "$@"
