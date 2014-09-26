# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

export GREP_OPTIONS='--color=always'

alias v="ls -lahG"
alias difns="git diff --name-status origin/master"
alias difcw="git diff --color-words origin/master"
alias fetch="git fetch origin"
alias merge="git merge origin/master"


