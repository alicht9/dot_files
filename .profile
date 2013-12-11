export CLICOLOR=1
export LSCOLORS="GxGxBxDxCxEgEdxbxgxcxd"
export PAGER="more"

complete -r cd

export PS1="\H[\!] "

alias rm='rm -i'

#ssh
alias ssh='ssh -X'
alias dev3='ssh alicht@dev-code03.nj01.shuttercloud.net'
alias ..='cd ../'
alias ....='cd ../../'
alias paper='cat >/dev/null'
alias ww='w| grep -v alicht'
alias vi='vim -o'
alias :wq="echo You\'re not in vim dumbass"
alias :q=":wq"
alias bc='bc -l'
alias mroe='more'
alias ci='vi'
#ls
if [ `uname` == "Linux" ]; then
	alias ls='ls --color'
	alias l='ls --color'
	alias ll='ls -laF --color'
	alias s='ls --color'
else
	alias ls='ls -G'
	alias l='ls -G'
	alias ll='ls -laFG'
	alias s='ls -G'
	export TERM="xterm"
fi
