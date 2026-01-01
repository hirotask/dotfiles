# .bash_profile

# Only run stty if we have a tty
if [ -t 0 ]; then
  stty stop undef
  stty start undef
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
