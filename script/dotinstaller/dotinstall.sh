#!/usr/bin/env bash

set -ue

#--------------------------------------------------------------#
##          Functions                                         ##
#--------------------------------------------------------------#

function helpmsg() {
	print_default "Usage: ${BASH_SOURCE[0]:-$0} [install | update | link] [--help | -h]" 0>&2
	print_default "  install: add require package install and symbolic link to $HOME from dotfiles [default]"
	print_default "  update: add require package install or update."
	print_default "  link: only symbolic link to $HOME from dotfiles."
	print_default ""
}

#--------------------------------------------------------------#
##          main                                              ##
#--------------------------------------------------------------#

function main() {
	local current_dir
	current_dir=$(dirname "${BASH_SOURCE[0]:-$0}")
	source $current_dir/lib/utilfuncs.sh

	local is_install="false"
	local is_link="false"
	local is_update="false"

	while [ $# -gt 0 ]; do
		case ${1} in
			--help | -h)
				helpmsg
				exit 1
				;;
			install)
				is_install="true"
				is_update="true"
				is_link="true"
				;;
			update)
				is_install="true"
				is_link="false"
				is_update="true"
				;;
			link)
				is_install="false"
				is_link="true"
				is_update="false"
				;;
			--all) ;;

			--verbose | --debug)
				set -x
				shift
				;;
			*)
				echo "[ERROR] Invalid arguments '${1}'"
				usage
				exit 1
				;;
		esac
		shift
	done

	# default behaviour
	if [[ "$is_install" == false && "$is_link" == false && "$is_update" == false ]]; then
		is_install="true"
		is_link="true"
		is_update="true"
	fi

	if [[ "$is_install" = true ]]; then
		source $current_dir/lib/install-required-packages.sh
	fi

	if [[ "$is_link" = true ]]; then
		source $current_dir/lib/link-to-homedir.sh
		source $current_dir/lib/gitconfig.sh
		print_info ""
		print_info "#####################################################"
		print_info "$(basename "${BASH_SOURCE[0]:-$0}") link success!!!"
		print_info "#####################################################"
		print_info ""
	fi

	if [[ "$is_update" = true ]]; then
		source $current_dir/lib/install-basic-packages.sh
		source $current_dir/lib/install-neovim.sh

		print_info ""
		print_info "#####################################################"
		print_info "$(basename "${BASH_SOURCE[0]:-$0}") update finish!!!"
		print_info "#####################################################"
		print_info ""
	fi
}

main "$@"
