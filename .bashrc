# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	else
		return 0
	fi
	echo -e "$gitver"
}

branch_color ()
{
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		color=""
		if git diff --quiet 2>/dev/null >&2
		then
			color="${c_sgr0}"
		else
			color=${c_red}
		fi
	else
			return 0
	fi
	echo -ne $color
}

on_master ()
{
	if git rev-parse --git-dir >/dev/null 2>&1
	then
		color=""
		gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
		if git diff origin/$gitver --quiet 2>/dev/null >&2
		then
			color="${c_sgr0}"
		else
			color=${c_red}
		fi
	else
			return 0
	fi
	echo -ne "${color}${1}"
}

PS1='[\u] \[${c_green}\]\w\[${c_sgr0}\] \[$(on_master [)\]\[${c_sgr0}\]\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\[$(on_master ])\]\[${c_sgr0}\]: '
source ~/.git-completion.sh
