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
	local install_extra_packages="false"

	while [ $# -gt 0 ]; do
		case ${1} in
			--help | -h)
				helpmsg
				exit 1
				;;
			install)
				is_install="true"
				install_extra_packages="true"
				is_link="true"
				;;
			install-extra)
				is_install="true"
				is_link="false"
				install_extra_packages="true"
				;;
			link)
				is_install="false"
				is_link="true"
				install_extra_packages="false"
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
	if [[ "$is_install" == false && "$is_link" == false && "$install_extra_packages" == false ]]; then
		is_install="true"
		is_link="true"
		install_extra_packages="true"
	fi

	if [[ "$is_install" = true ]]; then
		source $current_dir/lib/install_required_packages.sh
		print_info ""
		print_info "#####################################################"
		print_info "$(basename "${BASH_SOURCE[0]:-$0}") install required packages!!!"
		print_info "#####################################################"
		print_info ""

		if [[ "$install_extra_packages" = true ]]; then
			source $current_dir/lib/install_extra_packages.sh
			print_info ""
			print_info "#####################################################"
			print_info "$(basename "${BASH_SOURCE[0]:-$0}") install extra packages!!!"
			print_info "#####################################################"
			print_info ""
		fi
	fi

	if [[ "$is_link" = true ]]; then
		source $current_dir/lib/link_homedir.sh
		source $current_dir/lib/gitconfig.sh
		print_info ""
		print_info "#####################################################"
		print_info "$(basename "${BASH_SOURCE[0]:-$0}") link success!!!"
		print_info "#####################################################"
		print_info ""
	fi
}

main "$@"
