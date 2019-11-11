export ZSH="/home/yuval/.oh-my-zsh"

ZSH_THEME="yuval"

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false

plugins=(git forgit tmux zsh-autosuggestions zsh-syntax-highlighting vi-mode history-substring-search colored-man-pages command-not-found fzf)

source $ZSH/oh-my-zsh.sh

source ~/.aliases 2>/dev/null
source ~/.exports 2>/dev/null
source ~/.aqua 2>/dev/null
source ~/.functions 2>/dev/null

unsetopt AUTO_CD
setopt rmstarsilent
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

alias nano=vim

bindkey '^K' kill-line
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word



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

# Remove mode switching delay.
KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}
