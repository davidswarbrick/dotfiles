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
path+=('/home/david/.local/bin')
path+=('/home/david/LAIIER/eagle_build_pack_scripts')
export PATH
setopt COMPLETE_ALIASES
alias ls='ls --color=auto'
alias put='rmapi put'
alias n='ncmpcpp'
alias cv='scp ~/Downloads/cover.jpg homepi:~/'
alias s='~/swarbs_turntable/status-update.py'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gco='git checkout'
alias eagle='QT_SCALE_FACTOR=2 eagle'
alias firefox='MOZ_ENABLE_WAYLAND=1 firefox'
alias get_idf=". $HOME/esp/esp-idf/export.sh"
# Resize jpg to 5MB for Twitter upload
function tw-jpg-conv(){
  convert $1 -define jpeg:extent=5000kb $1
}
# Copy playlist to Walkman
function walkman(){
  awk '$0="Library/"$0' $1 > /run/media/david/SD_CARD/MUSIC/$1
}
PROMPT='%F{yellow}%B%.%f%b '
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
# Searchable history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end
