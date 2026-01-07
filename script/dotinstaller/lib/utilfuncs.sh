#!/usr/bin/env bash

function print_default() {
	echo -e "$*"
}

function print_info() {
	echo -e "\e[1;36m$*\e[m" # cyan
}

function print_notice() {
	echo -e "\e[1;35m$*\e[m" # magenta
}

function print_success() {
	echo -e "\e[1;32m$*\e[m" # green
}

function print_warning() {
	echo -e "\e[1;33m$*\e[m" # yellow
}

function print_error() {
	echo -e "\e[1;31m$*\e[m" # red
}

function print_debug() {
	echo -e "\e[1;34m$*\e[m" # blue
}

function chkcmd() {
	if ! builtin command -v "$1"; then
		print_error "${1} command not found"
		exit
	fi
}

function yes_or_no_select() {
	local answer
	print_notice "$1"
	read -r answer
	case $answer in
		yes | y)
			return 0
			;;
		no | n)
			return 1
			;;
		*)
			yes_or_no_select
			;;
	esac
}

function append_file_if_not_exist() {
	contents="$1"
	target_file="$2"
	if ! grep -q "${contents}" "${target_file}"; then
		echo "${contents}" >>"${target_file}"
	fi
}

function whichdistro() {
	#which yum > /dev/null && { echo redhat; return; }
	#which zypper > /dev/null && { echo opensuse; return; }
	#which apt-get > /dev/null && { echo debian; return; }
	if [ -f /etc/debian_version ]; then
		echo debian
		return
	elif [ -f /etc/fedora-release ]; then
		# echo fedora; return;
		echo redhat
		return
	elif [ -f /etc/redhat-release ]; then
		echo redhat
		return
	elif [ -f /etc/arch-release ]; then
		echo arch
		return
	elif [ -f /etc/alpine-release ]; then
		echo alpine
		return
	fi
}

function checkinstall() {
	local distro
	distro=$(whichdistro)
	if [[ $distro == "redhat" ]]; then
		sudo yum clean all
		if ! grep -i "fedora" /etc/redhat-release >/dev/null; then
			sudo yum install -y epel-release
			if [[ $(cat /etc/*release | grep '^VERSION=' | cut -d '"' -f 2 | cut -d " " -f 1) -ge 8 ]]; then
				sudo dnf install -y 'dnf-command(config-manager)'
				sudo dnf config-manager --set-enabled powertools
			fi
		fi
	fi

	local pkgs="$*"
	if [[ $distro == "debian" ]]; then
		pkgs=${pkgs//python-pip/python3-pip}
		sudo DEBIAN_FRONTEND=noninteractive apt-get install -y $pkgs
	elif [[ $distro == "redhat" ]]; then
		sudo yum install -y $pkgs
	elif [[ $distro == "arch" ]]; then
		sudo pacman -S --noconfirm --needed $pkgs
	elif [[ $distro == "alpine" ]]; then
		sudo bash -c "$(declare -f append_file_if_not_exist); append_file_if_not_exist http://dl-3.alpinelinux.org/alpine/edge/testing/ /etc/apk/repositories"
		pkgs=${pkgs//python-pip/py-pip}
		sudo apk add $pkgs
	else
		sudo brew install $pkgs
	fi
}

function git_clone_or_fetch() {
	local repo="$1"
	local dest="$2"
	local name
	name=$(basename "$repo")
	if [ ! -d "$dest/.git" ]; then
		print_default "Installing $name..."
		print_default ""
		mkdir -p $dest
		git clone --depth 1 $repo $dest
	else
		print_default "Pulling $name..."
		(
			builtin cd $dest && git pull --depth 1 --rebase origin "$(basename "$(git symbolic-ref --short refs/remotes/origin/HEAD)")" ||
			print_notice "Exec in compatibility mode [git pull --rebase]" &&
			builtin cd $dest && git fetch --unshallow && git rebase origin/"$(basename "$(git symbolic-ref --short refs/remotes/origin/HEAD)")"
		)
	fi
}

function mkdir_not_exist() {
	if [ ! -d "$1" ]; then
		mkdir -p "$1"
	fi
}

## Read lines from a file into an array (mapfile/readarray fallback)
#
# Usage:
#   read_lines_into_array result_array_name file_path [skip_comments] [ignore_empty]
#   - result_array_name: name of array variable to set (without $)
#   - file_path: path to input file
#   - skip_comments: "true" to ignore lines starting with # (optional)
#   - ignore_empty: "true" to ignore empty lines (optional)
#
# This function trims a trailing CR (\r) from each line so files with CRLF
# line endings behave sensibly on Unix. If the file does not exist it sets
# the named array to an empty array and returns success.
function read_lines_into_array() {
	local __resultvar="$1"
	local __file="$2"
	local __skip_comments="${3:-false}"
	local __ignore_empty="${4:-false}"
	local -a __lines=()

	if [[ -z "$__resultvar" ]]; then
		print_error "read_lines_into_array: result array name required"
		return 2
	fi

	if [[ ! -f "$__file" ]]; then
		# Ensure caller receives an empty array
		eval "$__resultvar=()"
		return 0
	fi

	while IFS= read -r __line || [[ -n $__line ]]; do
		# remove CR from CRLF files
		__line="${__line%$'\r'}"

		if [[ "$__ignore_empty" == "true" && -z "$__line" ]]; then
			continue
		fi

		if [[ "$__skip_comments" == "true" ]]; then
			# skip lines that start with optional whitespace then #
			if [[ "$__line" =~ ^[[:space:]]*# ]]; then
				continue
			fi
		fi

		__lines+=("$__line")
	done <"$__file"

	# assign the temporary array to the caller's array variable
	eval "$__resultvar=(\"\${__lines[@]}\")"
}

# Compatibility helper: prefer builtin mapfile/readarray when available
# Usage: mapfile_compat array_name file_path
function mapfile_compat() {
	local __arrname="$1"
	local __file="$2"
	if [[ $(type -t mapfile) == builtin ]]; then
		# use subshellless redirection like original usage
		mapfile -t "$__arrname" <"$__file"
	else
		# fallback: ignore comment lines and keep empty lines (behaviour can be adjusted)
		read_lines_into_array "$__arrname" "$__file" false false
	fi
}
