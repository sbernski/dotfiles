###########################################################        
# Options for Zsh

export HISTFILE=~/.zhistory
export HISTSIZE=50000
export SAVEHIST=50000
eval `dircolors -b`

autoload -U compinit promptinit colors
compinit
promptinit
colors
setopt pushdminus pushdsilent pushdtohome pushd_ignore_dups
setopt cdablevars
setopt interactivecomments
setopt clobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt hist_ignore_dups
setopt share_history
setopt SH_WORD_SPLIT
setopt nohup
setopt correct
setopt extendedglob
setopt long_list_jobs
setopt bash_auto_list
setopt hash_list_all
setopt no_beep

# PS1 and PS2
PROMPT="%{$fg[green]%}%~ %{$fg[red]%}%# %{$reset_color%}"
SPROMPT="Correct %{$fg[red]%}%R%{$reset_color%} to %{$fg[green]%}%r%{$reset_color%}? "

# Exports
export EDITOR="vim"
export BROWSER="w3m"
export PATH="$HOME/bin:/usr/share/java/apache-ant/bin:$PATH"

##################################################################
# Completion Related

zstyle ":completion:*commands" rehash 1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# For kill/killall
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*' menu yes select

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

##################################################################
# Key bindings
# http://mundy.yazzy.org/unix/zsh.php
# http://www.zsh.org/mla/users/2000/msg00727.html

typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey '^[w' backward-delete-to-slash
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

##################################################################
# My aliases

# Set up auto extension stuff
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feh
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

# Normal aliases
alias ls='ls --color=auto'
alias ..='cd ..'
alias c='clear'
alias dir='ls -1'
alias mem='free -m'

# sudo aliases
alias reflector="sudo reflector"

# Functions

tmplt () {
	case "$1" in
	py)	echo "#!/usr/bin/env python\n# -*- coding: utf-8 -*-" > "$2"
		;;
	py2)	echo "#!/usr/bin/env python2\n# -*- coding: utf-8 -*-" > "$2"
		;;
	py3)	echo "#!/usr/bin/env python3\n# -*- coding: utf-8 -*-" > "$2"
		;;
	*)	echo "No template set for this filetype"
		;;
	esac
}

mkcd () {
	mkdir -p "$1" && cd "$1"
}
# Nocorrect aliases
alias cp="nocorrect cp"
alias mv="nocorrect mv"
alias mkdir="nocorrect mkdir"
