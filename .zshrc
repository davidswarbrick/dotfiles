# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
autoload -Uz compinit 
compinit
setopt COMPLETE_ALIASES
alias ls='ls --color=auto'
alias put='rmapi put'
alias n="ncmpcpp"
alias cv="scp ~/Downloads/cover.jpg homepi:~/"
alias cdm="cd ~/Documents/Cambridge/Master\'s\ Project/"
PROMPT="%F{yellow}%B%.%f%b "
# Right prompt: git branch, unstaged changes:red staged:yellow none:green
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{green}%c%u(%b)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}'