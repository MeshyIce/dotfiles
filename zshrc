export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="yuval"

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=true
export ZSH_TMUX_UNICODE=true
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting history-substring-search colored-man-pages command-not-found fzf)

source $ZSH/oh-my-zsh.sh

source ~/.aliases 2>/dev/null
source ~/.exports 2>/dev/null
source ~/.functions 2>/dev/null

unsetopt AUTO_CD
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt rmstarsilent

alias nano=vim

bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '\e[1;5A' history-beginning-search-backward
bindkey '\e[1;5B' history-beginning-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word
bindkey '^ ' autosuggest-accept

# https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-389324292
# This speeds up pasting w/ autosuggest
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
zstyle ':completion:*' expand prefix suffix

# Always have an I-beam cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# Enable FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
